

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
sudo nvpmodel -m [mode]
```
For max performance use mode 0 and refer to this [link](https://www.jetsonhacks.com/2017/03/25/nvpmodel-nvidia-jetson-tx2-development-kit/) for all mode documentation.
    
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
wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
./install_geographiclib_datasets.sh
```
```
cd ~/src/catkin_ws && \
catkin_make -j6;
```
## Install opencv for CUDA :
```
cd ~/src && \
git clone https://github.com/opencv/opencv.git
cd opencv && \
git checkout 3.3.1
cd ..
```
```
git clone https://github.com/opencv/opencv_contrib.git
cd opencv && \
git checkout 3.3.1
cd ..
```
```
cd opencv && \
mkdir build && \
cd build && \
```
Try cmake with this command line
```
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -D WITH_CUDA=ON -D WITH_TBB=ON -D ENABLE_FAST_MATH=1 -D CUDA_FAST_MATH=1 -D WITH_CUBLAS=1 -D WITH_QT=OFF ..
```
But if it doesn't work, add **-DENABLE_PRECOMPILED_HEADERS=OFF**.
Then :
```
make -j6
sudo make install
cd ../ && rm -rf build/
```

## Clean up :
```
cd ~/src && \
rm -r -f installROSTX2
```
