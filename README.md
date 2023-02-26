# Automotive-Security
On the New era of self driving technology automotive security has become one of the most interesting field for Security researchers. In this mordern world when you drive a car, you are driving a very powerfull computer that happens to have wheels and steering. Today there is no such component in a car that is not being moderated by a Computer. Hence the Risk of Being Exploited also increses.

## Overview

- Network Topology
- Can-Bus
  - it's Other Varients 
- SocetCan
- ICSim
- Kayak
- Attacks
  - Sniffer
  - Sender 
  - Replay Attack
  - Script Attack 
  
## Network Topology
- Vehicles nowadays have dedicated ECU for working of each of Components such as Tire Pressure Monitor Systems, Temprature and Infortainment Control, Shaders Controls, Instrument Clusters etc. The Major Network Topologies used in CAN Networks are:
  - Bus Topology
  <img src = "https://user-images.githubusercontent.com/100958162/221414549-41b24b76-31d8-41f8-b46b-cc07ad614091.png" width ="50%">
  
  - Ring Topology
  <img src = "https://user-images.githubusercontent.com/100958162/221414835-44a2237b-cd2a-4b77-8451-e7cdb0baa36e.png" width = "50%" height = "200" >

  - Star Topology
  <img src="https://user-images.githubusercontent.com/100958162/221414844-5f38e79e-910f-4bf4-9f74-00f41b093edd.png" width="50%" height ="50%">
  
  **However the Network paradigm used inside most of the Vehicles nowadays is CAN-Bus Topology**
  <img src ="https://user-images.githubusercontent.com/100958162/221415320-84b8877a-e154-46d2-a09f-0cde3f7dce1c.png" width ="60%" height="300">
  
## CAN-Bus
Controlled Area Network or CAN Network is like the Nervous system of a car responsible for it's entire working and intervehicular communication. Since CAN-Bus follows bus topology each nodes are interconnected to a single bus line making it possible in a two way communication between any two nodes at a time.A node brodcastes a CAN signal to all the other node, the corresponding node with the matching destination adress captures the data. 
A Serial CAN Communication 

<img src="https://user-images.githubusercontent.com/100958162/221421092-2629f478-e5b4-4e2f-ba47-4dfae6ec2f36.png" width="50%" height="300">
- Can Networks can be interfaced using OBD ports, Usually they are present below the steering column or hidden somewhere in the dash.
- There are mainly two types of CAN Data 
  - Standard CAN PAckets 
  - Extended CAN Packets

#### Apart from CAN there are also other Protocols that are made by diffrent Brands are used for handiling diffrent technical situations inside the Car
- ISO-TP Protocol
  - Used to send CAN data Packets Exceeding 8byte of the Standard CAN protocol
- CanOpen Protocol
  - Changed the 11byte arbiary Id to a combination of 4bit function cod and 7bit Node ID, therefore csn be used for Precise Data Transfer
- The GMLAN Bus 
  - Uses Single Wire Low Speed and Double Wire High Speed Bus
- The SAEJ1850 Protocol
  - Old and Slower than Can But Easy to Imlement 
- The Keyword Protocol
  - Communicates through KWP2000 line(pin 7), the data may contain upto 255 byte
- The Local InterConnect Network Protocol
  - Faster than Can since it doesn't contain any Identifier ID, a single master Controls all the Slave Nodes
- The MOst Protocol
  - Media Oriented System Transport designed for multimedia devices, usually used to acces any internal mic or output Displays in a IVT Console or any hardware components that has a media console
- The Flex Ray Bus
  - High Speed Data Transfer Upto 10Mbps, Uses twisted wires to communicate, but can also used dual-channel communication.
- Automotive Ethernet

## SocketCan 
SocketCan is a Linux Utility that combines/unifies all the CAN tools and it's diffrent interfaces to a uniques interface. It Can also be used to create tools for supporting CAN, that enables us to try diffrent Options on the Persisting Can Networks. SocketCan ties user to the Linux Netwroking Kernal making it possible for creating a sperate interface for unifying all the CAN Networks.
A detailed writeup on Installing and Configuring SocketCan is given on it's Official [Github](https://github.com/linux-can/socketcand)

## ICSim
To practice CAN-Bus exploitation we will be using an ICSim package from Craig Smith. ICSim includes a dashboard with speedometer, door lock
indicators, turn signal indicators and a control panel. The control panel allows the user to interact with the simulated automobile network, applying
acceleration, brakes, controlling the door locks and turn signals.
### Installing ICSim

You will need:
* SDL2
* SDL2_Image
* can-utils

You can get can-utils from github or on Ubuntu you may run the follwoing

```
  sudo apt-get install libsdl2-dev libsdl2-image-dev can-utils  
```

You can run the following commands to setup a virtual can interface

```
  sudo modprobe can
  sudo modprobe vcan
  sudo ip link add dev vcan0 type vcan
  sudo ip link set up vcan0
```

If you type ifconfig vcan0 you should see a vcan0 interface. A setup_vcan.sh file has also been provided with this
repo.

**Usage**

Default operations:

Start the Instrument Cluster (IC) simulator:

```
  ./icsim vcan0
```

Then startup the controls

```
  ./controls vcan0
```
<table align="center">
<tr>
<td><img src="https://user-images.githubusercontent.com/100958162/221443075-da04eb22-d9a1-48c4-b414-d71bff62f33a.png" width ="100%" height="80%"></td>
<td><img src="https://user-images.githubusercontent.com/100958162/221443109-0245da80-a0f4-47a2-b0fc-8660d29b5fb3.png" width="50%" height="50%"></td>
</tr>
</table>
