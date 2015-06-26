////// LOAD IP GEOCODE //////

//use the API from the site freegeoip.net to geolocate the coordinates of the IP addresses
//important: no more than 10000 queries accepted in an hour!

JSONObject geocode;

float IPlongitude(String date) {

  geocode = loadJSONObject("http://freegeoip.net/json/"+date);

  float longitude = geocode.getFloat("longitude"); //gets longitude
  return(longitude);
}

float IPlatitude(String date) {

  geocode = loadJSONObject("http://freegeoip.net/json/"+date);

  float latitude = geocode.getFloat("latitude"); //get latitude
  return(latitude);
}

float pixelX= 0;
float pixelY= 0;

public float geoToPixelX(float lon) // convert coordinates in pixels
{
  if (lon>0) //longitude
    pixelX = map(lon, -180, 0, 0, width/2);
  if (lon<0)
    pixelX = map(lon, 0, 180, width/2, width);

  return pixelX;
}

public float geoToPixelY(float lat)
{
  if (lat<0) //latitude
    pixelY = map(lat, -90, 0, height, height/2);
  if (lat>0)
    pixelY = map(lat, 0, 90, height/2, 0);

  return pixelY ;
}