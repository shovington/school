
This is the procedure to create a Wireless Access Point from your Jetson TX2. Whit this WAP you'll be able to access your Jetson via ssh without access to internet on Jetson nor PC.

## First, create a new Wifi Network :

Click on the top right corner network icon, then **Edit Connections ...** 
Click **Add**, chose **Wi-Fi** and **Create ...**
Then enter the in each tab what's on the screenshots.

![General_tab](/Deleaves/CreateWAP/Screenshot/General_tab.png)
![Wi-Fi_tab](/Deleaves/CreateWAP/Screenshot/Wi-Fi_tab.png)
![Wi-Fi_Security_tab](/Deleaves/CreateWAP/Screenshot/Wi-Fi_Security.png)
![IPv4_Setting_tab](/Deleaves/CreateWAP/Screenshot/IPv4_Setting.png)
![IPv6_Setting_tab](/Deleaves/CreateWAP/Screenshot/IPv6_Setting.png)


Next enter in terminal :
```
sudo gedit /etc/NetworkManager/system-connections/${WAP_NAME}
```
and make sure this is the exact same thing as the WAP-Name file in this folder.
## Connect to the new Wi-Fi network :

Click on the top right corner network icon, then **Connect to Hidden Wi-Fi Network...**.
Select the network you've just created (You should see a confirmation of connection).

Repeat the same thin on your PC.

## Connect to Jetson via ssh :

In terminal :
```
ssh ${JETSON_USERNAME}@10.42.0.1
```





 




