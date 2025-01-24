#!/bin/bash

###############################################################################
#                        TURBOT INSTALL FIRST TIME                            #
# @brief: Script to install turbot_stack for the first time on a computer.    #
# @author: Bo Miquel Nordfeldt-Fiol                                           #
# @date: Winter 2025                                                          #
###############################################################################

# 1. Keep ubuntu up to date.
sudo apt -y update
sudo apt -y upgrade

# 2. Install dependencies.
sudo apt -y install libboost-thread-dev libboost-date-time-dev libboost-filesystem-dev libeigen3-dev libtinyxml-dev python3 # cola2_lib
sudo apt -y install lcov # cola2_core
sudo apt -y install ros-noetic-joy ros-noetic-rosbridge-server # cola2_sparus2

# 3. Download submodules from github.
bash download_repositories.sh

# 4. Install cola2_lib
cd cola2_lib
mkdir build
cd build
cmake ..
make
sudo make install
cd ../..

# 5. Compile cola2_lib_ros and cola2_core separately just in case.
catkin build cola2_lib_ros
catkin build cola2_core

# 6. Compile the rest of the packages.
catkin build