////// LOAD GOOGLE SPREADSHEET //////

// G_Spreadsheet_Data TABLE [JSON / Public url]
// © Daniele @ Fupete for the course ID2 @ UnirSM  
// Update table version by Giuseppe D'Ambrosio 
// github.com/fupete — github.com/Fupete/ID2-2015
// Educational purpose, MIT License, march 2015, San Marino
// 

String all_title[] = new String[100];  // titles  (first column value)
String row_string[][] = new String[100][2100]; // lines  [column][row]
int[] maxRow = new int[2100];  // max number of rows for each column
int  maxColumn=0; // max number of columns

void printTable (String all_title[], String row_string[][], int maxColumn, int[] maxRow) {

  for (int i =0; i<maxColumn; i++) { // print the json
    println (all_title[i]+":");
    println (); 
    for (int j = 1; j < maxRow[i]; j++) {
      print ("["+row_string[i][j]+"]  ");
    }
    println ();  
    println ();
  }
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
  parse_G_Spreadsheet_JSON(G_Spreadsheet_data); // < this start the magic
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

    /** start patched function **/

    // String used to process the json
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    // search the max number of column
    for (int r= 0; r<str.length (); r++ ) {
      if ( index.indexOf(str.charAt(r)+str(1)) == 0) {  
        maxColumn=r+1;  // Count the number of columns until it finds more
      }
    }

    for (int j= 0; j< maxColumn; j++ ) {

      // search the title of the column and inserts it in the all_title array [j] according to its location j
      // example column 1 (j=1) ... column n (j=n)
      if (index.equals(str.charAt(j)+str(1)) == true) { 
        all_title[j]=value;
      }

      // search all the line (row) of a  specific column [j] 
      if (current_column == str.charAt(j)) { 
        row_string[j][maxRow[j]]=value;       //  maxRow is the number of rows for each column
        maxRow[j]++;
      }
    }
  }
} 