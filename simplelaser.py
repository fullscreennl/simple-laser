import os
import string
import math
import Image, ImageDraw
from xml.dom import minidom
import numpy as np

MACHINE_SIZE = (1250,900)
STEPS_PER_MM = 100.0
COLOR_TO_POWER_MAP = {"white":0,"lime":30,"red":80,"blue":25,"yellow":50,"#288cf0":23}
SIMULATOR_PIXELS_PER_MM = 5
 
class SimpleLaser:

    def __init__(self,eps_filename=None):
        self.svg_units_to_mm_ratio = 1
        paths = self.openJob(eps_filename)
        self.model = Model(paths,self.svg_units_to_mm_ratio)
        self.simulator = Simulator(self.model.getData())

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
            self.buildPaths()
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
        self.steps = np.array([(0,0,0,0)], dtype=np.int)
        prev = self.translated_paths[0]
        for p in self.translated_paths:
            delta_x = p[0] - prev[0]
            delta_y = p[1] - prev[1]
            state = p[2]
            power = p[3]
            if abs(delta_x) + abs(delta_y) > 0:
                numpy_arr = self.expandWithLaserStateAndPower(delta_x,delta_y,state,power)
                self.steps = np.concatenate((self.steps,numpy_arr))
            prev = p

    def expandWithLaserStateAndPower(self,delta_x,delta_y,state,power):

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

        return np.column_stack((x_arr,y_arr,state_arr,power_arr)) 

    def translate(self,coord):
        coord = coord.split(",")
        x,y = (float(coord[0]) / self.svg_units_to_mm_ratio) * STEPS_PER_MM , (float(coord[1]) / self.svg_units_to_mm_ratio) * STEPS_PER_MM
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
    def __init__(self):
        pass

class Generator:
    def __init__(self):
        pass

class Easer:
    def __init__(self):
        pass

class Simulator:
    def __init__(self,data):
        x_steps = 0
        y_steps = 0
        w,h = MACHINE_SIZE
        self.canvas = Image.new('RGBA',(int(w*SIMULATOR_PIXELS_PER_MM),int(h*SIMULATOR_PIXELS_PER_MM)),(255,255,255,255))
        self.draw = ImageDraw.Draw(self.canvas)
        for d in data:
            x_steps += self.valueForStep(d,0)
            y_steps += self.valueForStep(d,1) 
            x = (x_steps / STEPS_PER_MM) * SIMULATOR_PIXELS_PER_MM
            y = (y_steps / STEPS_PER_MM) * SIMULATOR_PIXELS_PER_MM
            x = int(round(x))
            y = -int(round(y)) + 900*SIMULATOR_PIXELS_PER_MM
            if d[2]:
                self.draw.ellipse((x-1,y-1,x+3,y+3),fill=(0,0,0,255))
            else:
                self.draw.ellipse((x-5,y-5,x+9,y+9),fill=(255,0,0,128))
        self.canvas.save("simulated_output.png")

    def valueForStep(self,d,index):
        v = d[index]
        if v == 0:
            return -1
        elif v == 2:
            return 1
        else:
            return 0


if __name__ == "__main__":
    SimpleLaser("test_laser_job.eps")







