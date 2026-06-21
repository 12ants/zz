#!/bin/bash
(date && printf %b "____ $PDW ____\n") >> /home/aa/op/lo.log; 
####
/home/aa/.kilo/bin/kilo run --auto "run tests and fix any failures. add short log to a logfile"; 
sleep 22; 
/home/aa/.kilo/bin/kilo run --auto "analyze this project and come up with suggestions on how to fix, improve, enhance and optimize this project and write them in to a well structured list and save as a md file with descriptive title"; 
####
(date && printf %b "____ $PDW ____\n") >> /home/aa/op/lo.log; 
