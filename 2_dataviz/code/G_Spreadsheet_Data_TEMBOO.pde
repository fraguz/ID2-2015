// -
// G_Spreadsheet_Data_TEMBOO 0.1 [XML / TEMBOO mod]
// © Daniele @ Fupete for the course ID2-2015 @ UnirSM  
// github.com/fupete — github.com/fupete/ID2-2015
// Made for educational purposes, MIT License, february 2015, Crespina
// —
// Load and parse XML data from a TEMBOO magic trick to 
// connect the new Google Spreadsheets API
// Collect columns contents in List arrays (A_values, B_values, ...) 
// and column titles in String variables (A_title, B_title, ...)
// Credits to Jer Thorp on why connect G_Spreadsheet to Processing http://goo.gl/MQNsxr
// - 


XML[] G_Datas;

// holders for title/List values <<<< modify to your needs! <<<<
String A_title, B_title; // < holders for column titles, first row, ex. title will be the content from A1, B1, ...
IntList A_values = new IntList(); // < column A, integers, ages
StringList B_values = new StringList(); // < column B, strings, names


void setup() {
  
  // load data < run the RetrieveCellFeed Choreo/Temboo magic trick
  runRetrieveCellFeedChoreo();
  
  // parse data
  parse_G_Spreadsheet_XML(G_Datas);
 
  // are they loaded&parsed?
  println (A_title);  println (A_values);  // < column A, integers, ages
  println (B_title);  println (B_values);  // < column B, strings, names
  
}


void draw() {

  // do something with your data
  
};


void parse_G_Spreadsheet_XML(XML[] jdata) {
   
  int row,col;
  String value;
  
  for (int i = 0; i < G_Datas.length; i++) {
    
      row = int(G_Datas[i].getString("row"));
      col = int(G_Datas[i].getString("col"));
      value = G_Datas[i].getContent();
      
      // fill the right title/List values <<<< modify to your needs! <<<<
      if (row==1 && col==1) { A_title = value; } else
      if (row==1 && col==2) { B_title = value; } else 
      if (col==1) { A_values.append(int(value)); } else
      if (col==2) { B_values.append(value); }
      
  }

}


// -
// THE TEMBOO MAGIC API TRICK
// Insert your credentials in place of
// <<<< XX >>>> down in order to run...
// —

import com.temboo.core.*;
import com.temboo.Library.Google.Spreadsheets.*;

// Create a session using your Temboo account application details
TembooSession session = new TembooSession("<<<< username >>>>", "<<<< application >>>>", "<<<< id >>>>");

void runRetrieveCellFeedChoreo() {
  println("Connecting to Google Sheets....");
  
  // Create the Choreo object using your Temboo session
  RetrieveCellFeed retrieveCellFeedChoreo = new RetrieveCellFeed(session);

  // XML scope: 'https://spreadsheets.google.com/feeds'

  // Set inputs
  retrieveCellFeedChoreo.setClientSecret("<<<< yourClientSecret >>>>");
  retrieveCellFeedChoreo.setAccessToken("<<<< yourAccessToken >>>>");
  retrieveCellFeedChoreo.setWorksheetId("od6");
  retrieveCellFeedChoreo.setRefreshToken("<<<< yourRefreshToken >>>>");
  retrieveCellFeedChoreo.setClientID("<<<< yourClientID >>>>");
  retrieveCellFeedChoreo.setSpreadsheetKey("<<<< yourSpreadsheetKey >>>>");

  // Run the Choreo and store the results
  RetrieveCellFeedResultSet retrieveCellFeedResults = retrieveCellFeedChoreo.run();

  // Let's talk XML 
  XML xml = parseXML(retrieveCellFeedResults.getResponse());
  
  if (xml == null) {
    println("XML could not be parsed."); } 
  else {    
    println("Parsing XML..");
    println();
    G_Datas = xml.getChildren("entry/gs:cell");
  }

}
