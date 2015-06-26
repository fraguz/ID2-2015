#Chaotic Flow

###Abstract Flow Visualization of Copenhagen Bike Traffic

####by Illutron, 2012


###1 - What is it?

![] (http://media.johan.cc/cache/e6/25/e625da8861eed1aebb5760ab33c677a2.jpg)

#####Description by the author
Using water pumps, compressed air and 1000 meters of PVC tubing we designed a sculpture that simulates the flow of bike traffic through the streets and pathways of Copenhagen. Presenting the real data in an abstract form.
The sculpture was commissioned by the organizers of the 4S/EASST which has taken place in Copenhagen in 2012.

#####Context
The EASST is the European Association for the Study of Science and Technology and that year the theme of the Conference was the Copenhagenization phenomenon: the status a city acquires as a site for experimental design, green city development and bicycling, first developed when a part of Broadway, in Manhattan, was turned into a bike path.
The participants were from many different countries, so the organizers wanted to create a warm environment throwing the city in the conference. That's why they asked Illutron an installation for the reception hall which would relate to Copenhagen being an extraordinary good city for biking.

#####What it is, actually.

![] (http://payload118.cargocollective.com/1/7/254186/4668096/IMG_9671.jpg)

The installation was made by 10 triangle wood structures hung on the ceiling with wires, the triangle frames hold transparent tubes in which colored liquids flow through.
Illutron had access to the city database and worked with the dataset on city biking.
The colored liquids that flow through the transparent tubes represent the flow of the bikes in the city. This is the result of three stages: in the first place those numbers were real bikes and bikers, then they became numbers and, after Illutron handled them, they came back again to the physic realm but in an abstract way, transformed in fluids.
The installation was not only visual but also sounded with registrations of mechanical parts of a moving bycicle tooken by the authors themselves. Those sounds were audible with headphones placed under the installation.


#####How it works
The real deal was competing with daylight because, in the place chosen for the installation, transparent liquids were not easy to show from distance.
So they came up with the choice of using lots of colors which were easier to show in a proper way and represented bike fluxes better.
In the second storey of the hall, they had the control center with the liquid tanks, computers and controllers.

![] (http://payload118.cargocollective.com/1/7/254186/4668096/IMG_1380.jpg)

Physically, the liquids were pushed at different times by controlled pumps.
The headphones were connected to the central system and they played an edited sequence of sounds.
Illutron converted the statistical dataset in an abstract simulation with python and c++ with openframeworks.
All this stuff was put together in a system thanks to Arduino. The complete code is accessible at [Illutron GitHub page] (https://github.com/Illutron/chaosflow).

Quoting from [the coder site] (http://johan.cc/2012/12/28/chaotic-flow/):
_"The technical system behind the installation consists of a set of python scripts for converting the raw data that we received in a set of similarly (as in not identically) formatted .xlsx files. The scripts imports the data to a mongodb database, does geocode lookups and a thin python server written using flask and pymongo returns the data as json. The auditive element of the installation is a maxMSP patch that mixes recordings of traffic and mechanical sounds from bike parts according to the current amount of traffic in the simulation that it receives over OSC from openframeworks. An openframeworks application runs the actual simulation. It maps paths through the city to paths through the sculpture. Three arduino boards control the pumps, air pressure regulators and magnetic valves for the eight individual channels in the installation."_

#####About the artists
Illutron has a bunch of members and it's a collaborative interactive arts studio.

"_Illutron creates large scale interactive art, intriguing explorations into the realm where art and technology meet,
experiments in the water and is a place for individual or collaborative work._"

This is their headquarter

![] (http://payload68.cargocollective.com/1/7/254186/3661292/IllutronBarge_MathiasVejerslev_MVI_6696.jpg)

Their artistical research deals with many factors and media, such as the city and the relationship with data from the
traffic shown with lights or connecting people and make them mingle with fun; another path is the interaction between
mankind and machines, sometimes in a funny way, others in a more dramatic way. The media is mostly tangible with an
actual interaction, a concrete one.

To discover their works [click here] (http://illutron.dk/filter/showcase/)

#####Similar workpieces

######eCLOUD, 2007 and airFIELD, 2012: Ambient Airport Visualizations by Dan Goods, Nik Hafermaas and Aaron Koblin

![] (http://www.ecloudproject.com/images/index_01.jpg)

eCLOUD is an installation at the San Jose International Airport. It is made of many large LCD pixels laid out in 3D space whose opacity change as a function of weather.

![] (http://airfieldsculpture.com/img/pics/airfield00.jpg)

A similar installation called airFIELD was created by the same team few years later. It changes its shape synced with the air traffic and is installed at the Hartsfield-Jackson Atlanta International Airport.

#####Pneumatic Charts, Hive Big Data Think Tank, 2013

![] (http://dataphys.org/list/wp-content/uploads/2014/11/VisualizationPaloAltoHive.jpg)

The Hive Big Data Think Tank at Palo Alto created a device for visualizing city data (power, waste,
demographic, transportation) using blowers, microcontrollers and ping pongs balls.

######Drip-by-Tweet: Each Vote is a Drop, Domestic Data Streamer, 2014

![] (http://domesticstreamers.com/wp-content/uploads/4.jpg)

![] (http://domesticstreamers.com/wp-content/uploads/Liquid_tweets.jpg)

The team of developers Domestic Data Streamers created a real-time physical visualization of votes for a graphic design contest. A person can vote for a specific piece by sending a tweet, after which the machine releases a drop of yellow liquid and sends it to the corresponding test tube.


###2 - What it means

"_Usually you only relate to this kind of data in a quantitative way. We wanted to create an abstract representation
of the data that conveys something about how the system behind the data works creating a new kind of relation to
the dataset and perhaps inspiring new ways to think of it.
The spatial structure is modeled with inspiration from strange attractors and represent the often chaotic nature
of how cities and their infrastructure develop. The fractal is the model behind this installation."_

#####Source of inspiration
The starting point was the interest that Tobias Lukassen has always had towards fractals and chaotic systems, their
mathematical unpredictable results and the aesthetic beauty of their representations related to the city development.
Here an [explanation of fractals] (http://en.wikipedia.org/wiki/Fractal) and how a fractal look like:

![] (http://www.fractalsciencekit.com/fractals/large/Fractal-Mobius-Dragon-IFS-04.jpg)


###3 - What it could mean

Why triangles? This is the first question had come to my mind just because the other components of the installation are almost fully charged of well explained meaning. Well, the answer might be they've chosen triangles to represent the main pattern of the city from the satellite, but Google map discouraged this option of mine. The triangle are all of the same dimension and isosceles, with the sides lengthened beyond the vertex and this could represents a traffic cross. Putting the thoughts together, the wood frame might be the main roads and tubes are clearly the paths that bikes follow across the city. The fluxes of bikes flows as a liquid does while the frame are strictly stacked, as cars are in the traffic. The tubes overcome the single frame and connect different triangles. This could signify that like a liquid can infiltrate where it has the possibility to, with a bike you can go everywhere and it gives freedom of moving wherever you want while with a car you are framed.  
The abstract way the dataset is declared to be represented by the authors, became more concrete after the concept is explained and it becomes even more clear with the sounds. This installation evaluetes biking, establishing pathways like the city of Copenhagen does for its bikers.


###4 - What if

What if they had constructed the installation in a more pleacent way, I know it's about chaotic theories but, as the artists stated, even in the chaos there's beauty, which to me is harmony, a thing that this installation lacks, even though it is full of unconcealed, understandable meaning and I find this a really good thing for a piece of art intended to have a relationship with people.
What if the triagles were black and smokey like the traffic? It certainly would have been a feature that would have emphasized the difference between using a bike or a car and added to the installation a layer of awareness. 
