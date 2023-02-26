# Automotive-Security
On the New era of self driving technology automotive security has become one of the most interesting field for Security researchers. In this mordern world when you drive a car, you are driving a very powerfull computer that happens to have wheels and steering. Today there is no such component in a car that is not being moderated by a Computer. Hence the Risk of Being Exploited also increses.

## Overview

- Network Topology
- Can-Bus
  - it's Other Varients 
- SocetCan, Interfacing
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
  <img src ="https://user-images.githubusercontent.com/100958162/221415320-84b8877a-e154-46d2-a09f-0cde3f7dce1c.png" width ="80%" height="50%">
  
