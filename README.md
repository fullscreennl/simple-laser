Simple-laser
============

Control a laser cutter with Raspberry Pi.

What is this?
=============
This is an conversion of a 100w chinese lasercutter from a Leetro based machine with Lasercut 5.3 software to a simple system with a Raspberry Pi and and iPod touch.

*Removed Leetro components*
![Alt text](https://raw.github.com/fullscreennl/simple-laser/master/images/leetro.jpg "removed leetro parts.")

*Replaced with Raspberry Pi, 8bit dac and iPod UI*
![Alt text](https://raw.github.com/fullscreennl/simple-laser/master/images/ipod_controls.jpg "iPod controls and rasberryPi with dac.")

Why?
====
At Fullscreen.nl we are building our fablab and we just didn't want to work with Lasercut 5.3 a Windows PC and a Softdog anymore. Lasercut is required to control the Leetro MPC 6525. It requires a windows PC and a 'softdog' USB dongle. We had problems with complex cuttings paths, a bug in the software or the controller caused some paths not to close. We were also fed up with the *'Softdog error'*, *'Comunication has broken for timeout'* and *'Motioncard and softdog no same'* error messages.

We wanted to design in Viacad on a mac and simply have it cut on the machine. We don't do engraving. We mainly cut MDF and plywood. We wanted a simple linecolor to laserpower mapping.

How does it work?
=================

This software has 4 main components:

1) A server running on the Raspberry Pi `server.py`

2) A UI running on an iOS device, find the Xcode project in `simplelaserUI`

3) A driver written in C `driver.c`

4) A script wich generates machine instructions from cad drawings. `simplelaser.py`

###Dependencies
This solution makes use of the following software/libraries:

[pstoedit](http://www.pstoedit.net) for converting EPS files to flattened svg.

[python](http://www.python.org) with PIL for previews and Numpy.

[Xenomai Real-Time Framework for Linux](http://www.xenomai.org) for a low latency stepper driver.

[C library for Broadcom BCM 2835 as used in Raspberry Pi](http://www.airspayce.com/mikem/bcm2835/) for GPIO access with C.

[RPi.GPIO](https://pypi.python.org/pypi/RPi.GPIO) for GPIO access with Python.

###Connecting the dac

TODO: *Jeroen kun je dit even typen?*

###Starting the server

Install the startup script `startlaserservice.sh` to run the server as a deamon.
Read [here](http://blog.scphillips.com/2013/07/getting-a-python-script-to-run-in-the-background-as-a-service-on-boot/) how to do it. Reboot the Pi.
The server is now listening for commands from the iPod touch. The jogging of x-y-z axis and laser test pulses are executed by the server. If the server receives a startJob command it will start the driver and exit. (It is possible to run the machine from the command line without iPod, ssh to the Raspberry Pi and run the driver manually).

server.py

	def doLaserJob(self,arg):
        Popen(["/home/rpi/simplelaser/driver", "/home/rpi/simplelaser/laserjob.bin"],close_fds=True)
        self.close()
        os._exit(0)
        
manually:
        
        ./driver laserjob.bin
        
        
        
If the driver has finished the cutting job it will restart the server and exit, so the iPod touch UI becomes active again.

###Compiling the driver

There is no need for a cross compiler this will build quickly on the Raspberry Pi.

	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/xenomai/lib
	
	gcc -I/usr/xenomai/include -Ibcm2835-1.25 bcm2835-1.25/bcm2835.c driver.c -L/usr/xenomai/lib -lnative -lxenomai -o driver
	
###Building iPod touch UI

Open the folder *simplelaserUI* , open the xcode-project and build it to an iOS device. (it is designed to run on iPod touch 3.5 inch with iOS 6). The ip-address of the Raspberry Pi can be entered through settings.

###Testing the workflow

Export your toolpaths as .eps file and run:

	python simplelaser.py test_laser_job.eps
	
The script will output 2 files: 

1) *laserjob.bin* This is a binary file containing all the steppermotor instructions and laser power values to execute the cutting job. This file will be uploaded to the Raspberry Pi.

2) *simulated_output.png* This is a toolpath simulation generated from laserjob.bin data.

If the simulation looks OK jog the machine to start position with the iPod and hit start.

#Contact

[johan@fullscreen.nl](johan@fullscreen.nl)

[jeroen@fullscreen.nl](jeroen@fullscreen.nl)




	
	

	









