1) The firewall automatically uploads the reports in Google Spreadsheets as a .csv file.

2) "Load_GSpreadsheet" will parse and retrieve the data from the .csv. The columns which will be extracted are:

        -Source IP address
        -Destination IP address
        -Elapsed time

4) "Stichies Identicons" will take the string list from the _Source IP address_ column to generate a unique Identicon for each     new IP from the list.

3) "Load_geocodeIP" recalls the API from telize.com and geolocates the _Destination IP address_.         

5) The position of the Identicon will be updated and it will move from the center of the map, which is San Marino, to its given   position on a planet map. 

6) Once it has reached its destination, the _Elapsed time_ value will set the time the Identicon visualization will last.

7) "Times counter" will make a position on the map glows as the number of Identicon reaching that point grows.
        

