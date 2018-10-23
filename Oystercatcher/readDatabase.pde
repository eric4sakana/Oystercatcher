
void readDataSQLite(){
// for working with database
  db = new SQLite(this, dbName);
  
  if (db.connect()){
    String[] tableNames = db.getTableNames();
    println(tableNames);
    
    // testing different query statement,
    // based on actual table names, column names to work with.
    String testString_0 = "SELECT * FROM gps, model_output, habitat";
    String testString_1 = "SELECT birdID, latitude, longitude, timelbl2, date_time, place, SA8 " + 
      "FROM gps INNER JOIN model_output ON gps.obsID = model_output.obsID " +
      "INNER JOIN habitat ON gps.obsID = habitat.obsID";
    String testString_2 = "SELECT birdID, latitude, longitude, timelbl2, date_time, place, SA8 " + 
      "FROM gps LEFT OUTER JOIN model_output ON gps.obsID = model_output.obsID " +
      "LEFT OUTER JOIN habitat ON gps.obsID = habitat.obsID";
      
//    query from the above chosen statement. Our current csv data is the same as testString_2 (outer left join)
    db.query(testString_2);
    
    String[] columnNames = db.getColumnNames();  //for testing
    println(columnNames);    // for testing
    
    // start reading from database, after having defined date range
    while (db.next()){
      // to get the current date being read from the database
      String inputDateStr = db.getString("date_time");
      Calendar c = Calendar.getInstance();
          try{
            c.setTime(sdf.parse(inputDateStr));
            inputDate = c.getTime();
          } catch (ParseException e) {
          e.printStackTrace();
          }
      
      // conditions to filter the records only within our defined date range
      if (inputDate.after(beginDateBound) && inputDate.before(endDateBound)) {
        BirdsLocation birdsLocation = new BirdsLocation();
        birdsLocation.id = db.getInt("birdID");
        birdsLocation.behavior = db.getString("SA8");
        birdsLocation.dateTime = db.getString("date_time");
        birdsLocation.habitat = db.getString("place");
        birdsLocation.dayNight = db.getString("timelbl2");
        float lat = db.getFloat("latitude");
        float lng = db.getFloat("longitude");
        birdsLocation.location = new Location(lat, lng);
        // Add to list of all birds Locations
        birdsLocations.add(birdsLocation);
  
        println(birdsLocation.id, " ", birdsLocation.habitat, " ", 
           birdsLocation.dateTime, " ", birdsLocation.location);    // testing
      }
    }
  }
}



//  DATE FILTER added --Need to test if running.

void readDataCSV(){
Table table = loadTable(tableName,"header");
  for (TableRow birdsLocationRow : table.rows()) {
    
    // to get the current date being read from the database
      String inputDateStr = birdsLocationRow.getString("date_time");
      Calendar c = Calendar.getInstance();
          try{
            c.setTime(sdf2.parse(inputDateStr));
            inputDate = c.getTime();
          } catch (ParseException e) {
          e.printStackTrace();
          }
          
           // conditions to filter the records only within our defined date range
      if (inputDate.after(beginDateBound) && inputDate.before(endDateBound)) {
    
    // Create new empty object to store data
    BirdsLocation birdsLocation = new BirdsLocation();
    // Read data from CSV
    birdsLocation.id = birdsLocationRow.getInt("birdID");
    birdsLocation.behavior = birdsLocationRow.getString("SA8");
    birdsLocation.dateTime = birdsLocationRow.getString("date_time");
    birdsLocation.habitat = birdsLocationRow.getString("place");
    birdsLocation.habitat = birdsLocationRow.getString("place");
    birdsLocation.dayNight = birdsLocationRow.getString("timelbl2");
    float lat = birdsLocationRow.getFloat("latitude");
    float lng = birdsLocationRow.getFloat("longitude");
    birdsLocation.location = new Location(lat, lng);
    // Add to list of all birds Locations
    birdsLocations.add(birdsLocation);
      }
  }
}
