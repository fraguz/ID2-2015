// -
// G_Spreadsheet_Data 0.1 [JSON / Public url]
// © Daniele @ Fupete for the course ID2 @ UnirSM  
// github.com/fupete — github.com/Fupete/ID2-2015
// Educational purpose, MIT License, march 2015, San Marino
// —
// Load and parse JSON data from a public Google Spreadsheet Url
// Collect columns contents in List arrays (A_values, B_values, ...) 
// and column titles in String variables (A_title, B_title, ...)
// Credits to Jer Thorp on why connect G_Spreadsheet to Processing http://goo.gl/MQNsxr
// —


// holders for title/List values <<<< modify to your needs! <<<<
String A_title, B_title; // < holders for column titles, first row, ex. title will be the content from A1, B1, ...
StringList A_values = new StringList(); // < column A, strings, Source address
StringList B_values = new StringList(); // < column B, strings, Destination address


void setup() {

  // load&parse data
  //String url = "https://spreadsheets.google.com/feeds/cells/1N3nAcoJcDD-fhFWUvuKv4muI6jbxHG8y_TdEI-DgJSI/od6/public/basic?alt=json"; // < the spreadsheet must be published and available to a public url.
  String url = "https://spreadsheets.google.com/feeds/cells/1OVZzi-4PhccTvinEfRKGHma-RXmYTBBwpAkryRM4eIU/od6/public/basic?alt=json";
  load_G_Spreadsheet(url);

  // are they loaded&parsed?

  println (A_title);  
  println (A_values);  // < column A, integers, ages
  println (B_title);  
  println (B_values);  // < column B, strings, names
} 


void draw() {

  // do things with your data
}


void load_G_Spreadsheet(String url) {

  JSONObject G_Spreadsheet_data = null;

  try 
  { 
    G_Spreadsheet_data = loadJSONObject(url);
  } 
  catch(Exception el) 
  { 
    println("Error loading JSON"); 
    exit();
  }

  if (G_Spreadsheet_data == null) 
  { 
    println("No data"); 
    exit();
  } else 
    parse_G_Spreadsheet_JSON(G_Spreadsheet_data); // < this starts the magic
} 


void parse_G_Spreadsheet_JSON(JSONObject jdata) {

  JSONObject feed = jdata.getJSONObject("feed");
  JSONArray entries = feed.getJSONArray("entry");

  for (int i = 0; i < entries.size (); i++) {
    JSONObject entry = entries.getJSONObject(i);
    JSONObject entry_title = entry.getJSONObject("title");
    JSONObject entry_value = entry.getJSONObject("content");

    // cell content index
    String index = entry_title.getString("$t");
    char current_column = index.charAt(0); // < 'empiric' but works :)

    // cell content value
    String value = entry_value.getString("$t");

    // fill the right title/List values <<<< modify to your needs! <<<<
    if (index.equals("A1") == true) { 
      A_title = value;
    } else
      if (index.equals("B1") == true) { 
      B_title = value;
    } else 
      if (current_column == 'A') { 
      A_values.append(value);
    } else
      if (current_column == 'B') { 
      B_values.append(value);
    }
  }
} 
