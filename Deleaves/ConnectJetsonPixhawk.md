This is the procedure to connect a Jetson TX2 with orbitty carrier board and a Pixhawk 2 by UART.
## Install QGroundControl :
You have to install QGrounControl on a PC with Ubuntu.
```
sudo usermod -a -G dialout $USER
sudo apt-get remove modemmanager -y
sudo apt install gstreamer1.0-plugins-bad gstreamer1.0-libav -y
```
Download  [QGroundControl.AppImage](https://s3-us-west-2.amazonaws.com/qgroundcontrol/latest/QGroundControl.AppImage).
```
chmod +x ./QGroundControl.AppImage
./QGroundControl.AppImage
 ```

## Setup Pixhawk 2
Plug the Pixhawk 2 in PC's USB port with micro-usb.
In **QGroundControl**, go to setting and search for **SYS_COMPANION**
Select **SYS_COMPANION**, then **Companion Link (921600 baud, 8N1)**

## Connect Pixhawk and Jetson TX2
Create a cable to connect the two as it's explained [here](https://github.com/NVIDIA-AI-IOT/redtail/wiki/Dev-board-UART-and-Pixhawk-connection)
Plug the **TX** and **RX** Cable into pin **5** and **6** on orbitty carrier and in **TELEM2** on Pixhawk 2

Make sure to plug the cable when the Jetson is turn off or it will create a spark and the Jetson will shutdown.

## Test
```
roslaunch mavros px4.launch fcu_url:="/dev/ttyTHS2:921600"
```
In another terminal :
```
rostopic echo /mavros/imu/data
```
It should print on screen imu informations

