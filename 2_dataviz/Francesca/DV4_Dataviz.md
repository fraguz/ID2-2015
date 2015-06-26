#Dataviz

![](https://github.com/fraguz/ID2-2015/blob/4b3cef20273d2d6f8d6a5344756949e26bc4d93b/2_dataviz/Francesca/Dataviz.png?raw=true)

###1
The processing sketch loads a .json file hosted on GoogleSpreadsheet.
This file has two columns: the source IP address and the
destination IP address from the traffic log. This are the details that I decided to keep from the 41 columns of the original traffic log file.

###2
For each source IP address an Identicon is generated, thanks to [Stichties_Identicon](https://github.com/craftoid/stitchies-p5/blob/master/stitchies/stitchies.pde), a Martin Schneider sketch re-adapted for my purposes.

###3
A world map appears on the the Processing window, which is re-mapped to match the actual division into meridians and parallels of the Earth.
The Identicon will appear on the exact coordinates of Saint Marino and it will move to its destination IP address geolocated thanks to the API from the site [telize.com](http://telize.com).
