#Dataset

###Where data come from
The dataset for the project comes from the server of the UniRSM, more precisely, from the report of the firewall, which manage the connections of the WLAN and the LAN of the Saint Claire Monastery.  
Starting from the first connection of the day, the firewall gives to each user a private and unique IP address, which will last for the next 8 hours.
The traffic log is a table of 41 columns and infinite rows. These are the connections that each user requests, filed in a temporal sequence.
Each column gives different details about the connections.

![](https://github.com/fraguz/ID2-2015/blob/07c43d80cf12afb800fee1914631de5906c6645e/1_dataset/Francesca/log.png?raw=true)

###Develop of the concept
There were lots of possibilities since the data were that rich, but the project has taken the a specific direction: UniRSM is a real and virtual community and its inhabitants travel everyday from atoms to bits and viceversa.
Thee process is written in the traffic log: my virtual identity is represented by a unique IP address, the source IP address, this can be interpreted as I live in 
 192.168.25.63 street and, in order to get out of Saint Marino and begin my journey I must cross the borders, my private IP is translated into a public one thanks to the NAT address, the Network Address Translation, which makes me reach my destination, the destination IP address, in a certain time, the Elapsed time.

###Actual dataset
Narrowing the dataset for a faster prototyping, I kept the source and the destination IP address, meaningful data to describe a journey. 
