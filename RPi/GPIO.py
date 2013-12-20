import sys

BOARD = "MODE BOARD"
OUT = "TYPE OUT"
LOW = "HIGH"
HIGH = "LOW"

def setmode(mode):
    fname = sys._getframe().f_code.co_name
    print "function: ",fname," -> ",mode

def setwarnings(dowarnings):
    fname = sys._getframe().f_code.co_name
    print "function: ",fname," -> ",dowarnings

def setup(pin,mode):
    fname = sys._getframe().f_code.co_name
    print "function: ",fname," -> ",pin,mode

def output(pin,state):
    fname = sys._getframe().f_code.co_name
    print "function: ",fname," -> ",pin,state
