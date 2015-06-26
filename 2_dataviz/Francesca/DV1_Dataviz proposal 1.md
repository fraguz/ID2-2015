>####Agenda:
>>######1.Definitions
>>######2.Case History
>>######3.Dataset 
>>######4.Proposal 1
>>######5.Proposal 2
>>######6.Proposal 3

##1.Definitions

**Data visualization** is a general term that describes any effort to help people understand the significance of data by placing it in a visual context.

**Artistic data viz** is the appropriation and repurpose _of a "scientific" technique to create pieces that actively guide analytical reasoning and encourage a contextualized reading of their subject matter. [...] artistic visualizations are visualizations of data done by artists with the intent of making art._(credits to Artistic Data Visualization: Beyond Visual Analytics). It all starts from actual data which express their inner and deeply meaning, regardless of the exterior beauty.

I am at my very first attempts so I tried to express the data in a simple and clear way...

##2.Case History

As the weekly assignment was a deep explore of ["Dear data"] (http://www.dear-data.com/) by Giorgia Lupi and Stefanie Posavec, I found my source of inspiration among their works.

1) [Amazons data come to life]  (http://http://giorgialupi.com/amazons-data-come-to-life/), Giorgia Lupi, 2014

![] (http://static1.squarespace.com/static/550de105e4b05c49fa2bba03/5514665ae4b0fd1c92cd9243/551466d4e4b0ac69ef5e92a8/1427400410618/01.jpg?format=1500w)

2) [Illuminating data come to life] (http://tcnjartgallery.pages.tcnj.edu/files/2012/09/IlluminatingDataCatalogueTCNJ-1.pdf), Stefanie Posavec (co-author), 2013

![] (http://similardiversity.net/wp-content/uploads/2012/03/postcard-concept-5.jpg)

3) [Annual report] (http://feltron.com/FAR13_07.html), Nicholas Felton, 2013

![] (http://feltron.com/images/FAR13_07.jpg)


##3.Data set

UniRSM and:

a) the persons who live it

b) the physical structure

c) the relationship which occur between what is inside and/or what is outside

#####Refininig the data set and first hypotesis of visualization:

![] (https://raw.githubusercontent.com/fraguz/ID2-2015/e2e05b4696207628707d9604e717ed45348ea75e/2_dataviz/Francesca/IMG_20150408_102121.jpg)

######Explanation: 
I have choosen some of the data from the log file and I have put them on a flow determined by a time axis and a question axis. There's a begin and an end in the flow. 
The colors will always be: red (internal IPs) blue (nat IPs) green (destination IPs) and four tone variation for each color to visualize the grammar of the string xxx.xxx.xxx.xxx.

#####First hypotesis of visualization:

![] (https://github.com/fraguz/ID2-2015/blob/579daf5481732f650e7405e3b5f00b2d1045a65f/2_dataviz/Francesca/IMG_20150408_102150.jpg?raw=true)

#####Explanation: 
Like an undergound map the different data streams create their pattern from where they were generated towards their destination. The colors of the lines underline the different steps of the information and where it is in the process. The measures of the segments correspond to their numeric value (ex: 192.168.0.2 will be 1,92 cm .16,8cm . 0 (which will be a point)  . 0,2cm). The yellow shape is the firewall domain which acts like the great wall of China. The little boxes are the packages that are exchanged. The red square and the green dot means communication denied or allowed.

#####Second hypotesis of visualization:

![] (https://raw.githubusercontent.com/fraguz/ID2-2015/579daf5481732f650e7405e3b5f00b2d1045a65f/2_dataviz/Francesca/IMG_20150408_114421.jpg)

######Explanation: 
A rising sun of communication. To have further information read the explanations on the image.

#####Third hypotesis of visualization:

![] (https://raw.githubusercontent.com/fraguz/ID2-2015/579daf5481732f650e7405e3b5f00b2d1045a65f/2_dataviz/Francesca/IMG_20150408_120924.jpg)

######Explanation: 
This option explores another kind of representation based on a square grid an bars graph. The outside sides are occupied by url and group of applications, while the core is the private ip number of each user: 192.168.xxx.xxx will be always the same, so I represented them as fixed in the very center linked to the other bars on their sides to complete the information.  
