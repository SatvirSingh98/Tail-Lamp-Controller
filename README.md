# Tail-Lamp-Controller

## Problem
Design a vehicle tail lamp controller. There are 3 lamps on each side (left and right side) of the vehicle. Two inputs TURN_LEFT and TURN_RIGHT indicate the driver’s request for a left turn or a right turn. The light flash sequence is 0,1,2,3,0,1,2,3,…. There is an EMERGENCY input which indicates emergency mode and all the six lamps (both left and right) should flash in the sequence 0,1,2,3,2,1,0,1,2,3,2,1,0,…. Left and right should flash simultaneously. In emergency mode the rate of flashing should be double that of the flashing in TURN_LEFT or TURN_RIGHT mode. The block diagram of the controller and the light flash sequence are shown below.

<br>
![image](https://user-images.githubusercontent.com/67308779/151491877-cd453a16-989f-4221-b0d9-0b01c453d77d.png)

<br>
## Truth Table
![image](https://user-images.githubusercontent.com/67308779/151491981-70982885-bd6f-410e-98fb-4aa52a2e5aba.png)

<br>
## State Diagram
![image](https://user-images.githubusercontent.com/67308779/151492003-a6fb5241-39c2-45bb-b6e9-6953868646d4.png)

<br>
## Waveform for Turning Left
![image](https://user-images.githubusercontent.com/67308779/151492086-1f06e55a-b1d3-4906-acb6-8de76d7e1be7.png)

<br>
## Waveform for Turning Right
![image](https://user-images.githubusercontent.com/67308779/151492111-e6721928-a616-4153-9077-5fb5e8c707eb.png)

<br>
## Waveform for Emergency Sequence
![image](https://user-images.githubusercontent.com/67308779/151492160-3cc2afe0-073a-4048-b98d-e55979cf6155.png)
