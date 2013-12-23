import os
import string
import math
import Image, ImageDraw
from xml.dom import minidom
import numpy as np
import struct
import traceback
from time import gmtime, strftime


MACHINE_SIZE = (1250,900)

STEPS_PER_MM = (1.0 / 0.022500000000000 , 1.0 /  0.011250000000000)

COLOR_TO_POWER_MAP = {  
                        
                        'white':0,
                        'silver':1,
                        'gray':2,
                        'black':3,
                        '#288cf0':3, # viacad color if black background
                        'red':4,
                        'maroon':5,
                        'yellow':6,
                        'olive':7,
                        'lime':8,
                        'green':9,
                        'aqua':10,
                        'teal':11,
                        'blue':12,
                        'navy':13,
                        'fuchsia':14,
                        'purple':15
                        }

SIMULATOR_PIXELS_PER_MM = 5

class TimedLog:

    def __init__(self,msg):
        print msg," : ",strftime("%Y-%m-%d %H:%M:%S", gmtime())
 
class SimpleLaser:

    def __init__(self,eps_filename=None):
        self.svg_units_to_mm_ratio = 1
        TimedLog("Opening eps input file ...")
        paths = self.openJob(eps_filename)
        self.model = Model(paths,self.svg_units_to_mm_ratio)
        self.generator = Generator(self.model.getData())

    def openJob(self,eps_filename):
        svg_filename = None
        if eps_filename and ".eps" in eps_filename:

            svg_filename = eps_filename.replace(".eps",".svg")

            command = ["pstoedit -f plot-svg",eps_filename,svg_filename,"-flat 0 -nc"]
            command = string.join(command)

            try:
                pstoedit = os.popen(command, "r")
                status = pstoedit.close()
                if status:
                    raise IOError("pstoedit failed (status %d)" % status)
            except: 
                raise Exception("oops, can not convert eps file")

        doc = minidom.parse(svg_filename)
        path_strings = []

        for elem in doc.getElementsByTagName('g')[0].childNodes:
            if elem.nodeType != elem.TEXT_NODE and elem.getAttribute('stroke') != "white":
                if elem.tagName == "line":
                    path_strings += [self.lineToPathString(elem)]
                else:
                    path_strings += [(elem.getAttribute('stroke'),elem.getAttribute('points'),elem.tagName)]
            elif elem.nodeType != elem.TEXT_NODE and elem.getAttribute('stroke') == "white":
                self.setUnitsToMMRatio(elem)
                
        return path_strings

    def setUnitsToMMRatio(self,marker_xml):
        x1 = float(marker_xml.getAttribute('x1'))
        x2 = float(marker_xml.getAttribute('x2'))
        self.svg_units_to_mm_ratio = abs(x1 - x2) / 1250.0

    def lineToPathString(self,line_xml):
        path_string = u"%s,%s %s,%s"%(line_xml.getAttribute('x1'),line_xml.getAttribute('y1'),line_xml.getAttribute('x2'),line_xml.getAttribute('y2')) 
        return (line_xml.getAttribute('stroke'),path_string,"line")


class Model:

    def __init__(self,paths,svg_units_to_mm_ratio):
        if paths:
            self.current_state = (0,0,0,100) # x,y,on/off,power
            self.paths = paths
            self.svg_units_to_mm_ratio = svg_units_to_mm_ratio
            TimedLog("Building cutting paths ...")
            self.buildPaths()
            TimedLog("Expanding cutting paths to steps ...")
            self.expandPaths()

    def getData(self):
        return self.steps

    def buildPaths(self):
        coords = None
        self.translated_paths = []
        for p in self.paths:
            if coords:
                self.current_state = coords[-1]
            coords = []
            power = COLOR_TO_POWER_MAP[p[0]]
            path_type = p[2]
            xys = p[1].split(" ")
            for xy in xys:
                if xy != "":
                    coords.append(self.translate(xy)+(1,power))
            if path_type == "polygon":
                coords.append(coords[0])
            self.translated_paths += [self.current_state[:2]+(0,0),coords[0][:2]+(0,0)]
            self.translated_paths += coords

    def expandPaths(self):
        self.steps = np.array([(0,0,0,0,0)], dtype=np.int)
        prev = self.translated_paths[0]
        for p in self.translated_paths:
            delta_x = p[0] - prev[0]
            delta_y = p[1] - prev[1]
            state = p[2]
            power = p[3]
            if abs(delta_x) + abs(delta_y) > 0:
                numpy_arr = self.expandWithLaserStateAndPower(delta_x,delta_y,state,power,100)
                self.steps = np.concatenate((self.steps,numpy_arr))
            prev = p

    def expandWithLaserStateAndPower(self,delta_x,delta_y,state,power,speed):

        x = None
        y = None

        if delta_x < 0:
            step = 0
        else:
            step = 2
        x_arr = [step for st in range(abs(delta_x))]

        if delta_y < 0:
            step = 0
        else:
            step = 2
        y_arr = [step for st in range(abs(delta_y))]

        if len(y_arr) > len(x_arr):
            x = self.stretchTo(x_arr,len(y_arr))
            y = y_arr
        else:
            x = x_arr
            y = self.stretchTo(y_arr,len(x_arr))

        length = len(x)

        x_arr = np.array(x)
        y_arr = np.array(y)
        state_arr = np.zeros((length,), dtype=np.int) + state
        power_arr = np.zeros((length,), dtype=np.int) + power
        speed_arr = np.zeros((length,), dtype=np.int) + speed

        return np.column_stack((x_arr,y_arr,state_arr,power_arr,speed_arr)) 

    def translate(self,coord):
        coord = coord.split(",")
        x,y = (float(coord[0]) / self.svg_units_to_mm_ratio) * STEPS_PER_MM[0] , (float(coord[1]) / self.svg_units_to_mm_ratio) * STEPS_PER_MM[1]
        return int(round(x)),int(round(y))

    #http://stackoverflow.com/questions/12991962/stretching-a-list-in-python
    def stretchTo(self,arr, target_length):

        l = len(arr)
        out = [1] * target_length
        if l == 0:
            return out
        if l == 1:
            out[(target_length-1)//2] = arr[0]
            return out
        if l == target_length:
            return arr

        for i, x in enumerate(arr):
            out[i*(target_length-1)//(l-1)] = x
        return out

class Coder:

    #[ x y laser power speed]  
    #[ 0 0 1 30 499]
    def encode(self,data):
        x, y,laser,power,speed = data
        enc = 0 << 19
        enc = enc | (x << 17)
        enc = enc | (y << 15)
        enc = enc | (laser << 13)
        enc = enc | (power << 9)
        enc = enc | (speed << 0)
        return enc
        
    def decode(self,data):

        mask =          0b1100000000000000000
        power_mask =    0b0000001111000000000
        speed_mask =    0b0000000000111111111

        # print "// mask ",mask," ",bin(mask)
        # print "// power_mask ",power_mask," ",bin(power_mask)
        # print "// speed_mask ",speed_mask," ",bin(speed_mask)

        x = (data & mask) >> 17
        y = (data & mask >> 2) >> 15
        laser = (data & mask >> 4) >> 13
        power = (data & power_mask) >> 9
        speed = (data & speed_mask)

        return (x, y,laser,power,speed)

class Generator:
    def __init__(self,data):
        TimedLog("Encoding file ...")
        self.coder = Coder()
        binfile = open("laserjob.bin","wb")
        for d in data:
            sample = struct.pack('=L',self.coder.encode(tuple(d)))
            binfile.write(sample)
        binfile.close()

class Easer:
    def __init__(self):
        pass

class Simulator:

    def __init__(self,laser_job_filename = "laserjob.bin"):
        TimedLog("Simulating machine path ...")
        w,h = MACHINE_SIZE
        self.canvas = Image.new('RGBA',(int(w*SIMULATOR_PIXELS_PER_MM),int(h*SIMULATOR_PIXELS_PER_MM)),(255,255,255,255))
        self.draw = ImageDraw.Draw(self.canvas)
        self.readLaserJob(laser_job_filename)
        self.canvas.save("simulated_output.png")

    def write(self,msg):
        print msg

    def readLaserJob(self,laser_job_filename):
        x_steps = 0
        y_steps = 0
        coder = Coder()
        self.motiondata = open(laser_job_filename,'rb')
        try:
            byte = self.motiondata.read(4)
            while byte != "":
                sample = struct.unpack('=L',byte)
                x,y,laser,power,speed = coder.decode(sample[0])
                x_steps += self.valueForStep(x)
                y_steps += self.valueForStep(y) 
                x = (x_steps / STEPS_PER_MM[0]) * SIMULATOR_PIXELS_PER_MM
                y = (y_steps / STEPS_PER_MM[1]) * SIMULATOR_PIXELS_PER_MM
                x = int(round(x))
                y = -int(round(y)) + 900*SIMULATOR_PIXELS_PER_MM
                if laser:
                    self.draw.ellipse((x,y,x+1,y+1),fill=(0,0,0,255))
                else:
                    self.draw.ellipse((x,y,x+1,y+1),fill=(255,0,0,50))

                byte = self.motiondata.read(4)
        except:
            print "WARNING LASER ERROR !!"
            traceback.print_exc(self)

    def valueForStep(self,d):
        if d == 0:
            return -1
        elif d == 2:
            return 1
        else:
            return 0

#some TDD a day to keep the doctor away
def testCoder():
    coder = Coder()
    test_set = [(3,3,0,15,499),
                  (1,3,0,3,200),
                  (0,0,1,8,300),
                  (2,3,0,0,10),
                  (3,2,1,10,20),
                  (1,3,1,1,45)]
    for input_data in test_set:
        encoded = coder.encode(input_data)
        output_data = coder.decode(encoded)
        if input_data != output_data:
            raise Exception("Coder error!")

def testStepArrayStretch():
    model = Model(None,None)
    test_set = [  ([2,2,2],20),
                  ([2,0,0,2,0,2,2],1),
                  ([2,2,2,2,2],21),
                  ([2,2,2,2,2,2],30),
                  ([],120),
                  ([2],220)]
    for t in test_set: 
        input_arr, length = t
        if len(model.stretchTo(input_arr, length )) != length:
            raise Exception("step interpolation error!")

def test():
    testCoder()
    testStepArrayStretch()


if __name__ == "__main__":
    test()
    SimpleLaser("test_laser_job.eps")
    command = "scp laserjob.bin rpi@192.168.1.9:/home/rpi/simplelaser/laserjob.bin"
    res = os.system(command)
    if res:
        print "ERROR"
        print "auto scp failed, no key or host down?"
    else:
        print "Success, laserjob ready."
    Simulator()
    TimedLog("done ...")







