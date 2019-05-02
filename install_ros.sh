#!/bin/bash
# This file is for installing ROS on any PC with Ubuntu.

echo "First argument : ROS-distro indigo-kinetic-melodic"
echo "indigo"
echo "kinetic"
echo "melodic"
echo ""
echo "Second argument : Package desktop-full-desktop-ros-base"
echo "desktop-full"
echo "desktop"
echo "ros-base"
echo "Example : ./install_ros.sh kinetic desktop-full"



sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt-get update

sudo apt-get install ros-$1-$2

sudo rosdep init
rosdep update

echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential

echo "would you like to create a new workspace ? (y/n)"
read answer

if (answer -eq 'y'); then

source /opt/ros/$1/setup.bash
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make
source devel/setup.bash

