//// options to load whole data, or a given subset
//void loadDataByDate(String startDate, String endDate){
//    // found this technique from Github...
//    Calendar c = Calendar.getInstance();
//    try{
//      c.setTime(sdf.parse(beginDateStr));
//      c.add(Calendar.DATE, -1);    // decrease one day and check if current day is after
//      beginDateBound = c.getTime();  // one day earlier than actual selected date
//      
//      c.setTime(sdf.parse(endDateStr));
//      c.add(Calendar.DATE, 1);  // increase one day and check if current day is before
//      endDateBound = c.getTime();  // one day later than actual selected date
//      
//      println(inputDate, beginDateBound, endDateBound); // for testing
//     
//    } catch (ParseException e) {    // necessary to keep this Processing running for us
//      e.printStackTrace();
//    }    
//    
//    // start reading from database, after having defined date range
//    while (db.next()){
//      // to get the current date being read from the database
//      String inputDateStr = db.getString("date_time");
//          try{
//            c.setTime(sdf.parse(inputDateStr));
//            inputDate = c.getTime();
//          } catch (ParseException e) {
//          e.printStackTrace();
//          }
//      
//      // conditions to filter the records only within our defined date range
//      if (inputDate.after(beginDateBound) && inputDate.before(endDateBound)) {
//        BirdsLocation birdsLocation = new BirdsLocation();
//        birdsLocation.id = db.getInt("birdID");
//        birdsLocation.behavior = db.getString("SA8");
//        birdsLocation.dateTime = db.getString("date_time");
//        birdsLocation.habitat = db.getString("place");
//        birdsLocation.habitat = db.getString("place");
//        birdsLocation.dayNight = db.getString("timelbl2");
//        float lat = db.getFloat("latitude");
//        float lng = db.getFloat("longitude");
//        birdsLocation.location = new Location(lat, lng);
//        // Add to list of all birds Locations
//        birdsLocations.add(birdsLocation);
//  
//        println(birdsLocation.id, " ", birdsLocation.habitat, " ", 
//           birdsLocation.dateTime, " ", birdsLocation.location);    // testing
//      }
//    }
//}


//Button clicked, load the intended data   
void loadData(){
    if(Location_button && !HideUI_button){
    if (bird1_button==true && bird2_button==false && bird3_button==false){
        description(1);
    }
    
    if (bird1_button==false && bird2_button==true && bird3_button==false){
      description(2);
    } else if (bird1_button==false && bird2_button==false && bird3_button==true){
      
      description(3);
    } else if (bird1_button==true && bird2_button==true && bird3_button==false){
      description(4);
    } else if (bird1_button==false && bird2_button==true && bird3_button==true){
      description(5);
    } else if (bird1_button==true && bird2_button==true && bird3_button==true){
      description(7);
    } else if (bird1_button==true && bird2_button==false && bird3_button==true){
      description(6);
    } 
  }
  
      else if(habitat_button && !HideUI_button){
  if (bird1_button==false && bird2_button==false && bird3_button==false && !HideUI_button){
        description(9);
    }
  if (bird1_button==true && bird2_button==false && bird3_button==false){
        description(15);
    }
    if (bird1_button==false && bird2_button==true && bird3_button==false){
      description(16);
    } else if (bird1_button==false && bird2_button==false && bird3_button==true){
      
      description(17);
    } else if (bird1_button==true && bird2_button==true && bird3_button==false){
      description(18);
    } else if (bird1_button==false && bird2_button==true && bird3_button==true){
      description(19);
    } else if (bird1_button==true && bird2_button==true && bird3_button==true){
      description(20);
    } else if (bird1_button==true && bird2_button==false && bird3_button==true){
      description(21);
    }
  }
  else if(Behavior_button){
  if (bird1_button==true && bird2_button==false && bird3_button==false){
        description(25);
    }
    if (bird1_button==false && bird2_button==true && bird3_button==false){
      description(26);
    } else if (bird1_button==false && bird2_button==false && bird3_button==true){
      
      description(27);
    } else if (bird1_button==true && bird2_button==true && bird3_button==false){
      description(28);
    } else if (bird1_button==false && bird2_button==true && bird3_button==true){
      description(31);
    } else if (bird1_button==true && bird2_button==true && bird3_button==true){
      description(30);
    } else if (bird1_button==true && bird2_button==false && bird3_button==true){
      description(29);
    }
  }
  else if(day_button && !HideUI_button){
  if (bird1_button==true && bird2_button==false && bird3_button==false){
        description(32);
    }
    if (bird1_button==false && bird2_button==true && bird3_button==false){
      description(33);
    } else if (bird1_button==false && bird2_button==false && bird3_button==true){
      
      description(34);
    } else if (bird1_button==true && bird2_button==true && bird3_button==false){
      description(35);
    } else if (bird1_button==false && bird2_button==true && bird3_button==true){
      description(36);
    } else if (bird1_button==true && bird2_button==true && bird3_button==true){
      description(38);
    } else if (bird1_button==true && bird2_button==false && bird3_button==true){
      description(37);
    }
    
  }
  
  if(Behavior_button == true){
    if(!HideUI_button && (!bird1_button && !bird2_button && !bird3_button)){
      description(24);
    }
    
    int zl;
    zl=currentMap.getZoomLevel();
    if(zl>=15){
      for (BirdsLocation birdsLocation : birdsLocations) {
        birdsLocation.showLabel = false;
        ScreenPosition pos = currentMap.getScreenPosition(birdsLocation.location);
        if (dist(pos.x, pos.y, mouseX, mouseY) < 5) {
          birdsLocation.showLabel = true;
        }
      }
    }
    
    behaviors();
    behaviorLegend();
  }
  
  else if(habitat_button){
  bird_habitat();
        habitatLegend();
  }
  else if (Location_button){
  bird_locations();
  locationLegend();
  }
  else if(heatMap_button){
  heatmap();
  }
  else if(day_button){
  dayNight();
  dayNightLegend();
  }
  reset();
}

