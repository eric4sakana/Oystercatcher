
import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.ui.*;
import java.util.List;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.utils.*;

// important
import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;
// important
import de.bezier.data.sql.*;

// for working with database with actual database name
SQLite db;
String dbName = "oystercatcher_data.sqlite";

// for working with CSV table 
String tableName = "birdsData.csv";        // TO BE ADDED

//variables for different functions
//variables for drawing buttons
int start_x1 = 30, start_y1 = 635, gap = 90;
int width_b = 85, height_b = 23, rounding = 0;
int transpr = 180;
//draw "bird" group
int start_x2 = 420, start_y2 = 615;  
int width_bird = 88, height_bird = 30;  
	  
//reset, map_mode and full_view buttons
int gap_3b = 25;
int start_x_3b = 860;
int start_y_3b = 450;
int width_3b = 85, height_3b = 20;

//these are triggers, false as default
Boolean on_insBox =false;
Boolean insBox_button =true;
Boolean bird_1 = false; //whether cursor is over a record button
Boolean bird_2 = false;
Boolean bird_3 = false;
Boolean all_birds = false;
Boolean bird1_button = false; // whether users clicked the bird record button
Boolean bird2_button = false;
Boolean bird3_button = false;
Boolean bird123_button = false;
Boolean anime_1 = false;  //whether cursor is over an anime button
Boolean anime_2 = false;
Boolean anime_3 = false;
Boolean anime1_button = false;  //whether users clicked an anime button
Boolean anime2_button = false;
Boolean anime3_button = false;

Boolean on_day =false;
Boolean day_button =false;
Boolean HideUI = false;// whether cursor is over the HideUI button
Boolean HideUI_button = false;	// whether users clicked HideUI button

Boolean SideButton = false;
Boolean SideMenu_button = true;

Boolean all_date =false;
Boolean all_date_button =false;

Boolean change_map = false;
Boolean map_button = false; 

Boolean All_behaviors = false;
Boolean Behavior_button= false;
short cursor_over = 0;

Boolean map_reset= false;
Boolean reset_button =false;

Boolean All_habitat =false;
Boolean habitat_button =false;
Boolean dayNight_button =false;

Boolean All_location =false;
Boolean Location_button =false;
Boolean heatMap_button =false;
Boolean on_heatMap =false;

Boolean dbox =false;
Boolean dbox_button =true;

String date_range = "21 - 31 July 2009";

String beginDateStr, endDateStr;  // IT DEPENDS ON THE USER REQUIREMENTS.

// for working with date
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
SimpleDateFormat sdf2 = new SimpleDateFormat("MM/dd/yyyy");

Date inputDate, beginDateBound, endDateBound;
// DATE TO BE DEFINED!
  
	
//set the start location to Schiermonnikoog Island. Set compass and scale
Location Observing_Location= new Location(53.483, 6.24); 
ArrayList<BirdsLocation> birdsLocations = new ArrayList();


UnfoldingMap currentMap;
UnfoldingMap map1;
UnfoldingMap map2;
CompassUI compass;
BarScaleUI barScale;


PImage img_om, img_bird1, img_bird2, img_bird3, img_birdAll, compassImg;

void setup() {
  size(960,720);
  smooth();
  //load fonts

  compassImg = loadImage("compass1.png");
  
  // use map data from OpenStreetMap and Microsoft Bing Aerial
  map1 = new UnfoldingMap(this, new OpenStreetMap.OpenStreetMapProvider());
  map2 = new UnfoldingMap(this, new Microsoft.AerialProvider());
  currentMap = map1;
  currentMap.zoomAndPanTo(Observing_Location, 12);
  map2.zoomAndPanTo(Observing_Location,12);
  
  // create simultaneous mouse interaction for both maps
  EventDispatcher eventDispatcher = new EventDispatcher();
  MouseHandler mouseHandler = new MouseHandler(this, map1, map2);
  eventDispatcher.addBroadcaster(mouseHandler);
  eventDispatcher.register(map1, "pan");
  eventDispatcher.register(map1, "zoom");
  eventDispatcher.register(map2, "pan", map1.getId());
  eventDispatcher.register(map2, "zoom", map1.getId());
               
  //setup the barScale
  barScale = new BarScaleUI(this, currentMap, 740, 540);
  PFont myFont = createFont("Monospaced", 16);
  barScale.setStyle(color(0, 0), 6, -2, myFont);
		
  //setup the compass, but I cannot find the compass now LOL
  compass = new CompassUI(this,currentMap,compassImg, 40, 100); 
  barScale = new BarScaleUI(this, map2, 740, 540);
  barScale.setStyle(color(0, 0), 6, -2, myFont);
  
  //setup the compass, but I cannot find the compass now LOL
  compass = new CompassUI(this,map2,compassImg, 40, 100); 

  // in km  limit the pan area to 5.5km around the island
  float maxPanningDistance = 5.5; 
//  currentMap.setPanningRestriction(Observing_Location, maxPanningDistance); 
//  currentMap.setZoomRange(12,19);
//  map2.setPanningRestriction(Observing_Location, maxPanningDistance); 
//  map2.setZoomRange(12,19);

  //load buttons and overview images
  img_om = loadImage("overview_map.png");
  img_bird1 = loadImage("bird_166_icon.png");
  img_bird2 = loadImage("bird_167_icon.png");
  img_bird3 = loadImage("bird_169_icon.png");
  img_birdAll = loadImage("bird_all_icon.png");
  
  
  //---
      
    // DATE TO BE DEFINED!
    beginDateStr = "21-07-2009";  // it might change based on user input
    endDateStr = "31-07-2009";    // it might change based on user input    
    
//    loadDataByDate(beginDateStr, endDateStr);  // load data between given date range   
    Calendar c = Calendar.getInstance();
    try{
      c.setTime(sdf.parse(beginDateStr));
      c.add(Calendar.DATE, -1);    // decrease one day and check if current day is after
      beginDateBound = c.getTime();  // one day earlier than actual selected date
      
      c.setTime(sdf.parse(endDateStr));
      c.add(Calendar.DATE, 1);  // increase one day and check if current day is before
      endDateBound = c.getTime();  // one day later than actual selected date
      
      println(inputDate, beginDateBound, endDateBound); // for testing
     
    } catch (ParseException e) {    // necessary to keep this Processing running for us
      e.printStackTrace();
    }    
    
  
  
  //---
  
  //---
  
//  readDataSQLite();
  readDataCSV();
  
}

void draw(){  
  mouselisten(mouseX, mouseY);
  mapswitch();
  currentMap.draw();
  compass.draw();
  textSize(12);
  fill(0);
  barScale.draw();
  stroke(0);	
//  SideButton();
  reset();
  reset_button =false;
  drawButtons();
  loadData();  
}

//cursor on  button
boolean overbird(int x, int y, int width, int height){
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height){
    return true;
  } else {
    return false;
  }
}


//these functions still under development


/*
void animation(){
	3817 - 4331
	birdsLocation.obID = birdsLocationRow.getString("obsID");
 for()	
}
*/

