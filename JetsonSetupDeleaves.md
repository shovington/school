

## To falsh the Jetson TX2 and make it work with the Orbitty carrier board from connecttech :
follow the intructions on this [link](https://github.com/yasushisakai/jetson_miscellaneous/wiki/setup-Orbitty-Carrier-on-TX2)

The procedure is made for JetPack 3.1 but you can do it with Jetpack 3.3 if you want ubuntu 16.04. You just have to download the L4T r28.2X package instead of the L4T r28.1X

NOTE:   If you use Jetpack to flash the Jetson TX2 you'll not be able to use 
		        the usb nor ethernet port. 

NOTE:   The username will be nvidia and password nvidia

## To install ROS kinetic :
```
cd ~/src && git clone https://github.com/jetsonhacks/installROSTX2.git && \
cd installROSTX2 && ./installROS.sh -p ros-kinetic-desktop-full   
```
 
## Create workspace :
```
cd ~/src && git clone https://github.com/EskimoDesignLab/catkin_ws.git && \
echo "source ~/src/catkin_ws/devel/setup.bash" >> ~/.bashrc
```

## Activate all CPU :
```
sudo su && \
echo 1 > /sys/devices/system/cpu/cpu1/online && \
echo 1 > /sys/devices/system/cpu/cpu2/online && \
echo 1 > /sys/devices/system/cpu/cpu3/online && \
echo 1 > /sys/devices/system/cpu/cpu4/online && \
echo 1 > /sys/devices/system/cpu/cpu5/online
```
    
## Install dependencies :
```
cd ~/src && \
git clone https://github.com/IntelRealSense/librealsense.git && \
cd librealsense && \
sudo apt-get update && sudo apt-get upgrade -y && \
sudo apt-get install libusb-1.0-0-dev pkg-config -y && \
sudo apt-get install libgtk-3-dev &&\
sudo apt-get install qtcreator -y && \
sudo apt-get install cmake-curses-gui -y && \
sudo apt-get install libglfw3-dev -y && \
sudo apt-get install qdbus qmlscene qt5-default qt5-qmake qtbase5-dev-tools qtchooser qtdeclarative5-dev xbitmaps xterm libqt5svg5-dev qttools5-dev qtscript5-dev qtdeclarative5-folderlistmodel-plugin qtdeclarative5-controls-plugin -y && \
sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/ && \
sudo udevadm control --reload-rules && udevadm trigger && \
cd /usr/lib/aarch64-linux-gnu/ && \
sudo ln -sf tegra/libGL.so libGL.so
cd ~/src/catkin_make/src/librealsense && \
mkdir build && \
cd build && \
cmake .. -DBUILD_EXAMPLES:BOOL=true && \
make -j6 && \
sudo make install;
```
```
cd ~/src/catkin_ws/src && \
git clone https://github.com/intel-ros/realsense.git && \
```
```
sudo apt-get install ros-kinetic-mavros*
```
```
cd ~/src/catkin_ws && \
catkin_make -j6;
```

## Clean up :
```
cd ~/src && \
rm -r -f installROSTX2
```
