// create the interface UI 
void drawButtons(){
  
  String instructionText = "Please select the view options below: (1) by attribute and (2) by bird." + 
      " Click the button to show/hide. ";
  String insBox = "(close)";
      
  PFont titleFont = createFont("SansSerif",18);
  PFont subtitleFont = createFont("SansSerif",14);
  PFont citationFont = createFont("SansSerif",10);
  PFont buttonFont = createFont("SansSerif",15);
  
  //draw a reset button
  fill(255);
  rect(start_x_3b - 8, start_y_3b - gap_3b - 15, width_3b, height_3b, rounding);  
  textSize(12);
  fill(0);
  text("All /Subset", start_x_3b, start_y_3b - gap_3b) ;
  
  //draw a reset button
  fill(255);
  rect(start_x_3b - 8, start_y_3b - 15, width_3b, height_3b, rounding);  
  textSize(12);
  fill(0);
  text("Reset view", start_x_3b, start_y_3b);
  
  //draw a map switch button
  fill(255);
  rect(start_x_3b - 8, start_y_3b + gap_3b - 15, width_3b, height_3b, rounding);
  textSize(12);
  fill(0);
  text("Map mode", start_x_3b, start_y_3b + gap_3b);
  
   //draw a hideUI or Full View button for UI hiding
  fill(255);
  rect(start_x_3b - 8, start_y_3b + gap_3b*2 - 15, width_3b, height_3b, rounding);
  textSize(12);
  fill(0);
  text("Full view", start_x_3b, start_y_3b + gap_3b*2);
  
  if(insBox_button){
    int dialog_x = 120, dialog_y = 110;
    int dialog_width = 700;
    fill(255, 255, 255, 200);  // test
    rect(dialog_x-20, dialog_y-40, dialog_width, 70);  // test
    fill(0);
    textSize(15);
    text(instructionText, dialog_x, dialog_y);
    textSize(12);
    text(insBox, dialog_x + dialog_width - 60, dialog_y-25);
  }
  if(!HideUI_button){
     // drawing various buttons:
  
  noStroke();     // no textbox outline     - beware of its logical order
  fill(255, 255, 255, 200);  // white transparent  - beware of its logical order  

  //draw header box
  rect(5, 5, width-10, 55);         
  // draw footer box
  rect(5, height-40, width-10, 35); 
  // draw 'description textbox
  rect(420, 555, 365, 45);      //  - beware of its logical order
  fill(0);                      //  - beware of its logical order
 
  fill(255, 255, 255, 200);  // white transparent  - beware of its logical order  
  //  draw view options box
  rect(5, 610, 780, 65 );  //  - beware of its logical order


  fill(0);      //- beware of its logical order

  textFont(buttonFont);
  
  //draw "instruction text"
   
     //draw "attribute" option group
    fill(0);
    text("1) Select by attribute:", 20, 665);
    // set variables start_x, start_y to ease the positioning

// draw "instruction text"
   
     //draw "attribute" option group
    fill(0);
    text("1) Select by attribute:", 20, 665);
    // set variables start_x, start_y to ease the positioning
      // draw attribute buttons
    stroke(0);  
    if (!Behavior_button) {
    fill(255);
    }
    else if(Behavior_button){
    fill(0);
    }  
    rect(start_x1-10, start_y1-18, width_b, height_b, rounding);  //behaviour
    if (!habitat_button) {
    fill(255);
    }
    else if(habitat_button){
    fill(0);
    }
    rect(start_x1+gap*1-10, start_y1-18, width_b, height_b, rounding); //habitat
    if (!Location_button) {
    fill(255);
    }
    else if(Location_button){
    fill(0);
    }
    rect(start_x1+gap*2-10, start_y1-18, width_b, height_b, rounding);  //location
    if (!heatMap_button) {
    fill(255);
    }
    else if(heatMap_button){
    fill(0);
    }
    rect(start_x1+gap*3-10, start_y1-18, width_b, height_b, rounding);  //heatmap
    if (!day_button) {
    fill(255);
    }
    else if(day_button){
    fill(0);
    }
    rect(start_x1+gap*3-10, start_y1+28-18, width_b, height_b, rounding);  //day/night 
    
    // draw attribute text
    if (!Behavior_button) {
    fill(0);
    }
    else if(Behavior_button){
    fill(255);
    }
    text("behaviour", start_x1, start_y1);
    if (!habitat_button) {
    fill(0);
    }
    else if(habitat_button){
    fill(255);
    }
    text("habitat", start_x1+gap*1, start_y1);
    if (!Location_button) {
    fill(0);
    }
    else if(Location_button){
    fill(255);
    }
    text("location", start_x1+gap*2, start_y1);
    if (!heatMap_button) {
    fill(0);
    }
    else if(heatMap_button){
    fill(255);
    }
    text("heatmap", start_x1+gap*3, start_y1);  
    if (!day_button) {
    fill(0);
    }
    else if(day_button){
    fill(255);
    }

    text("day/night", start_x1+gap*3, start_y1+28);  
      
    fill(0);
    text("2) Select by bird, and modify the time:   TimeScroll", start_x2, 665);
    image(img_bird1, start_x2, start_y2, width_bird, height_bird);  

    image(img_bird2, start_x2+gap*1, start_y2, width_bird, height_bird);  
  
    image(img_bird3, start_x2+gap*2, start_y2, width_bird, height_bird);  

    image(img_birdAll, start_x2+gap*3, start_y2, width_bird, height_bird);  
    
    descriptiveText();
   }
}

// for switching map mode (OSM map or Bing Aerial)
void mapswitch(){
  currentMap = map1;
  if(map_button){
    currentMap=map2;
  }
}

// reset the interface
void reset(){
  if(reset_button){
    bird1_button = false; 
    bird2_button = false;
    bird3_button = false;  
    bird123_button = false;
    anime1_button = false;  
    anime2_button = false;
    anime3_button = false;
    HideUI_button = false;  
    SideButton = false;
    SideMenu_button = true;
    Behavior_button= false;
    currentMap =map1;
    habitat_button =false;
    dayNight_button =false;
    Location_button =false;
    heatMap_button =false;
    map1.zoomAndPanTo(Observing_Location,12);
    map2.zoomAndPanTo(Observing_Location,12);
  }  
  
  reset_button =false;
}


//Created by Shirley Wang
void behaviors(){
  int transpr = 180;
  
  for (BirdsLocation birdsLocation : birdsLocations) {
    // Convert geo locations to screen positions
    ScreenPosition pos = currentMap.getScreenPosition(birdsLocation.location);
    
    noStroke();
    if (birdsLocation.id == 166 && bird1_button){
      if (birdsLocation.behavior.equals("body care")){
        fill(255, 50, 50, transpr);
      } 
      else if (birdsLocation.behavior.equals("forage")){
        fill(180, 141, 1, transpr);
      } 
      else if (birdsLocation.behavior.equals("sit")){
        fill(50, 255, 100, transpr);
      } 
      else if (birdsLocation.behavior.equals("fly")){
        fill(50, 255, 255, transpr);
      } 
      else {
        fill(0, 90,171, transpr);
      }
      ellipse(pos.x, pos.y, 6, 6);   
    }
    else if (birdsLocation.id == 167 && bird2_button){
      if (birdsLocation.behavior.equals("body care")){
        fill(255, 50, 50, transpr);
      } 
      else if (birdsLocation.behavior.equals("forage")){
        fill(180, 141, 1, transpr);
      } 
      else if (birdsLocation.behavior.equals("sit")){
        fill(50, 255, 100, transpr);
      } 
      else if (birdsLocation.behavior.equals("fly")){
        fill(50, 255, 255, transpr);
      } 
      else {
        fill(0, 90,171, transpr);
      }
      triangle(pos.x-4, pos.y, pos.x, pos.y-6, pos.x+4, pos.y);  
    }
    else if (birdsLocation.id == 169 && bird3_button){
      if (birdsLocation.behavior.equals("body care")){
        fill(255, 50, 50, transpr);
      } 
      else if (birdsLocation.behavior.equals("forage")){
        fill(180, 141, 1, transpr);
      } 
      else if (birdsLocation.behavior.equals("sit")){
        fill(50, 255, 100, transpr);
      } 
      else if (birdsLocation.behavior.equals("fly")){
        fill(50, 255, 255, transpr);
      } 
      else {
        fill(0, 90,171, transpr);
      }
      rect(pos.x-3, pos.y-3, 6, 6);
    }

  }
}

// draw location records of bird on the map, designed by Shirley
void bird_locations(){
  
  for (BirdsLocation birdsLocation : birdsLocations) {
    
    // Convert geo locations to screen positions
    ScreenPosition pos = currentMap.getScreenPosition(birdsLocation.location);
    
    if (birdsLocation.showLabel) {
      fill(255);
      textSize(30);
      text((char)birdsLocation.id, pos.x - textWidth((char)birdsLocation.id)/2, pos.y);
    }
     stroke(23,44,60);
    fill(0, 90, 171, 200);
    if ((birdsLocation.id == 166 && bird1_button) && Location_button ){
      
      ellipse(pos.x, pos.y, 6, 6);
    } else if (birdsLocation.id == 167 && bird2_button && Location_button){
      
       triangle(pos.x-4, pos.y, pos.x, pos.y-6, pos.x+4, pos.y);
    } else if ((birdsLocation.id == 169 && bird3_button) && Location_button){
     
       rect(pos.x-3, pos.y-3, 6, 6);
    }
  }
}



////Created by Shirley Wang
//void bird_habitat(){
//  
//  for (BirdsLocation birdsLocation : birdsLocations) {
//    //Convert geo locations to screen positions
//    ScreenPosition pos = currentMap.getScreenPosition(birdsLocation.location);
//    
//    if(bird1_button && (birdsLocation.id == 166) ){
//      noStroke();
////      if (birdsLocation.habitat.equals("Roost")){
//      if (birdsLocation.habitat.equals("Roost")){
//        fill(23, 50, 7,200);
//    //fill(23, 50, 7, 200);
//      }
//      else if (birdsLocation.habitat.equals("Territory")||birdsLocation.habitat.equals("Mudflats_Territory")){
//        fill(153, 77, 82,200);
//    //fill(153,77,82,200);
//    
//      }
//      else if (birdsLocation.habitat.equals("Mudflats")){
//        fill(230, 180, 80);
//      }
//      ellipse(pos.x, pos.y, 6, 6);
//    }
//    else if(bird2_button && birdsLocation.id == 167 ){
//      noStroke();
//      if (birdsLocation.habitat.equals("Roost") && birdsLocation.habitat != null ){
//        fill(23, 50, 7, 200);
//      }
//      else if (birdsLocation.habitat.equals("Territory")||birdsLocation.habitat.equals("Mudflats_Territory")){
//        fill(153, 77, 82, 200);
//      }
//      else if (birdsLocation.habitat.equals("Mudflats")){
//        fill(230, 180, 80, 200);
//      }
//      
//      triangle(pos.x-4, pos.y, pos.x, pos.y-6, pos.x+4, pos.y);
//    }
//    else if(bird3_button  && birdsLocation.id == 169){
//      noStroke();
//      if (birdsLocation.habitat.equals("Roost")){
//        fill(23, 50, 7, 200);
//      }
//      else if (birdsLocation.habitat.equals("Territory")||birdsLocation.habitat.equals("Mudflats_Territory")){
//        fill(153, 77, 82, 200);
//      }
//      else if (birdsLocation.habitat.equals("Mudflats")){
//        fill(230, 180, 80, 200);
//      }
//      
//      rect(pos.x-3, pos.y-3, 6, 6);
//    }          
//  }
//}

// Testing 2    
void bird_habitat(){
  
  for (BirdsLocation birdsLocation : birdsLocations) {
    //Convert geo locations to screen positions
    ScreenPosition pos = currentMap.getScreenPosition(birdsLocation.location);
    
    if(bird1_button && (birdsLocation.id == 166) ){
      noStroke();
//      if (birdsLocation.habitat.equals("Roost")){
      if ("Roost".equals(birdsLocation.habitat)){
        fill(23, 50, 7,200);
    //fill(23, 50, 7, 200);
      }
      else if ("Territory".equals(birdsLocation.habitat) || "Mudflats_Territory".equals(birdsLocation.habitat)){
        fill(153, 77, 82,200);
    //fill(153,77,82,200);
    
      }
      else if ("Mudflats".equals(birdsLocation.habitat)){
        fill(230, 180, 80);
      }
      ellipse(pos.x, pos.y, 6, 6);
    }
    else if(bird2_button && birdsLocation.id == 167 ){
      noStroke();
      if (birdsLocation.habitat.equals("Roost") && birdsLocation.habitat != null ){
        fill(23, 50, 7, 200);
      }
      else if (birdsLocation.habitat.equals("Territory")||birdsLocation.habitat.equals("Mudflats_Territory")){
        fill(153, 77, 82, 200);
      }
      else if (birdsLocation.habitat.equals("Mudflats")){
        fill(230, 180, 80, 200);
      }
      
      triangle(pos.x-4, pos.y, pos.x, pos.y-6, pos.x+4, pos.y);
    }
    else if(bird3_button  && birdsLocation.id == 169){
      noStroke();
      if (birdsLocation.habitat.equals("Roost")){
        fill(23, 50, 7, 200);
      }
      else if (birdsLocation.habitat.equals("Territory")||birdsLocation.habitat.equals("Mudflats_Territory")){
        fill(153, 77, 82, 200);
      }
      else if (birdsLocation.habitat.equals("Mudflats")){
        fill(230, 180, 80, 200);
      }
      
      rect(pos.x-3, pos.y-3, 6, 6);
    }          
  }
}


//Created by Shirley Wang
void dayNight(){
  
  for (BirdsLocation birdsLocation : birdsLocations) {
  // Convert geo locations to screen positions
    ScreenPosition pos = currentMap.getScreenPosition(birdsLocation.location);

  if(bird1_button && (birdsLocation.id == 166) ){
    if (birdsLocation.dayNight.equals("Night") ){
      fill(0, 90, 171, 150);
      noStroke();
      ellipse(pos.x, pos.y, 6, 6);
    }
     
    else if (birdsLocation.dayNight.equals("Day")){ 
      fill(255, 222, 0, 150);
      noStroke();
      ellipse(pos.x, pos.y, 6, 6);
    }  
  }
  else if(bird2_button && (birdsLocation.id == 167) ){
    if (birdsLocation.dayNight.equals("Night") ){
      fill(0, 90, 171, 150);
      noStroke();
      triangle(pos.x-6, pos.y, pos.x, pos.y-8, pos.x+6, pos.y);
    } 
    else if (birdsLocation.dayNight.equals("Day")){ 
      fill(255, 222, 0, 150);
      noStroke();
      triangle(pos.x-6, pos.y, pos.x, pos.y-8, pos.x+6, pos.y);
    }
  }
  else if(bird3_button && (birdsLocation.id == 169) ){
    if (birdsLocation.dayNight.equals("Night") ){
      fill(0, 90, 171, 150);
      noStroke();
      rect(pos.x-3, pos.y-3, 6, 6);
    } 
    else if (birdsLocation.dayNight.equals("Day")){ 
      fill(255, 222, 0, 150);
      noStroke();
      rect(pos.x-3, pos.y-3, 6, 6);
    }
  }
  }
}

// draw the heatMap points  Created by Shirley Wang
void heatmap(){
  for(BirdsLocation birdsLocation : birdsLocations){
    ScreenPosition pos = currentMap.getScreenPosition(birdsLocation.location);
    fill(255,0,0,20);
    noStroke();
    int radius = 16;
    ellipse(pos.x, pos.y, radius, radius);
  }
}
