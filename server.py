#!/usr/bin/python

import asyncore, asynchat
import os, socket, string
import traceback
import warnings
import os
from subprocess import Popen
import json
import RPi.GPIO as GPIO
import time


GPIO.setmode(GPIO.BOARD)
GPIO.setwarnings(False)

Z_DIR = 7
Z_CLOCK = 8
Y_CLOCK = 11
Y_DIR = 12
X_CLOCK = 13
X_DIR = 15
POWER_CTL_CLOCK = 18
POWER_1 = 21
POWER_2 = 22
POWER_3 = 23
POWER_4 = 24
LASER = 16

GPIO.setup(Z_DIR, GPIO.OUT)
GPIO.setup(Z_CLOCK, GPIO.OUT)
GPIO.setup(Y_CLOCK, GPIO.OUT)
GPIO.setup(Y_DIR, GPIO.OUT)
GPIO.setup(X_CLOCK, GPIO.OUT)
GPIO.setup(X_DIR, GPIO.OUT)
GPIO.setup(POWER_CTL_CLOCK, GPIO.OUT)
GPIO.setup(POWER_1, GPIO.OUT)
GPIO.setup(POWER_2, GPIO.OUT)
GPIO.setup(POWER_3, GPIO.OUT)
GPIO.setup(POWER_4, GPIO.OUT)
GPIO.setup(LASER, GPIO.OUT)

PORT = 20001

class Channel(asynchat.async_chat):

    def __init__(self, server, sock, addr, id):
        print "client connected ..."
        self.debug = 0
        asynchat.async_chat.__init__(self, sock)
        self.set_terminator("\0")
        self.request = None
        self.data = ""
        self.server = server
        self.command_stopped = True
        self.dispatch_table = {
            'zup':(self.jogZ,1),
            'zdown':(self.jogZ,-1),
            'xup':(self.jogX,1),
            'xdown':(self.jogX,-1),
            'yup':(self.jogY,1),
            'ydown':(self.jogY,-1),
            'laser':(self.laserTest,1),
            'startjob':(self.doLaserJob,None),
            'stop':(self.stopJogging,None)
        }
        
    def handle_close(self):
        print "client left ..."
        self.command_stopped = True
        self.close()
   
    def handle_error(self):
        self.command_stopped = True
        asynchat.async_chat.handle_error(self)

    def collect_incoming_data(self, data):
        self.data = self.data + data

    def found_terminator(self):
        self.parseRequest(self.data)
        self.data = ""
        
    def parseRequest(self,data):
        try:
            obj = json.loads(str(data))
            action = obj['action']
            func = self.dispatch_table[action][0]
            arg = self.dispatch_table[action][1]
            func(arg)
        except OSError:
            if func.__name__ == "doLaserJob":
                print "LASERCUTTER DRIVER NOT FOUND"
                self.close()
        except:
            print "RMI ERROR"
            traceback.print_exc(file=self)

    def jogWithDirectionAndClock(self,dir_gpio,clock_gpio,direction):
        self.command_stopped = False
        if direction == 1: 
            GPIO.output(dir_gpio, GPIO.HIGH)
        elif direction == -1:
            GPIO.output(dir_gpio, GPIO.LOW)
        self.data = ""
        while 1:
            if self.command_stopped:
                return
            GPIO.output(clock_gpio, GPIO.HIGH)
            time.sleep(0.0001)
            GPIO.output(clock_gpio, GPIO.LOW)
            time.sleep(0.0001)
            asyncore.poll()

    def jogX(self,direction):
        self.jogWithDirectionAndClock(X_DIR,X_CLOCK,direction)

    def jogY(self,direction):
        self.jogWithDirectionAndClock(Y_DIR,Y_CLOCK,direction)

    def jogZ(self,direction):
        self.jogWithDirectionAndClock(Z_DIR,Z_CLOCK,direction)

    def stopJogging(self,direction):
        self.command_stopped = True

    def laserTest(self,arg):
        self.command_stopped = False
        self.laserOn(True)
        self.data = ""
        while 1:
            if self.command_stopped:
                break
            asyncore.poll()
        self.laserOn(False)

    def laserOn(self,on=False):
        GPIO.output(POWER_4, GPIO.LOW)
        GPIO.output(POWER_3, GPIO.LOW)
        GPIO.output(POWER_2, GPIO.LOW)
        if on:
            GPIO.output(POWER_1, GPIO.HIGH)
        else:
            GPIO.output(POWER_1, GPIO.LOW)
        GPIO.output(POWER_CTL_CLOCK, GPIO.HIGH)
        time.sleep(0.0001)
        GPIO.output(POWER_CTL_CLOCK, GPIO.LOW)
        time.sleep(0.0001)
        if on:
            GPIO.output(LASER, GPIO.LOW)
        else:
            GPIO.output(LASER, GPIO.HIGH)

    def doLaserJob(self,arg):
        Popen(["/home/rpi/simplelaser/driver", "/home/rpi/simplelaser/laserjob.bin"],close_fds=True)
        self.close()
        os._exit(0)
            
    def write(self,msg):
        print msg


class Server(asyncore.dispatcher):

    def __init__(self, port):
        self.client_id = 0
        self.clients = {}
        asyncore.dispatcher.__init__(self)
        self.create_socket(socket.AF_INET, socket.SOCK_STREAM)
        self.set_reuse_addr()
        self.bind(("", port))
        self.listen(5)

    def handle_accept(self):
        self.client_id = self.client_id + 1
        conn, addr = self.accept()
        ch = Channel(self, conn, addr, self.client_id)
        self.clients[self.client_id] = ch
             
if __name__ == '__main__':
    warnings.filterwarnings('ignore','.*',DeprecationWarning)
    s = Server(PORT)
    print "serving at port", PORT, "..."
    asyncore.loop(2)
    

