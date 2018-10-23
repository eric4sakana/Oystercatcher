//Created by Shirley Wang    // edited by Sam
void behaviorLegend(){
  int x = 20, y = 480 ;
  int wid = 20, heig = 15;
  int gap = 22 ;
  int transpr = 180;
  
  noStroke();
  // legend background box
  fill(255, 255, 255, 200);
  rect(x-5, y-5, 110, 112);
  // body_care
  fill(255, 50, 50, transpr);
  rect(x, y, wid, heig);
  // forage
  fill(180, 141, 1, transpr);
  rect(x, y+gap, wid, heig);
  
  // sit
  fill(50, 255, 100, transpr);
  rect(x, y+gap*2, wid, heig);
  
  // fly
  fill(50, 255, 255, transpr);
  rect(x, y+gap*3, wid, heig);
  
  // stand
  fill(0, 90,171, transpr);
  rect(x, y+gap*4, wid, heig);
  
  // label
  fill(0);
  textSize(15);
  
  text("body care", x+wid+10, y+12);
  text("forage", x+wid+10, y+12+gap*1);
  text("sit", x+wid+10, y+12+gap*2);
  text("fly", x+wid+10, y+12+gap*3);
  text("stand", x+wid+10, y+12+gap*4);
  //textSize(17);
  //text("legend", 25, 517);
}


void locationLegend(){
  int x = 20, y = 580 ;
  int wid = 20, heig = 15;
  int gap = 22 ;
  int transpr = 180;
  noStroke();
  // legend background box
  fill(255, 255, 255, 200);
  rect(x-5, y-5, 120, 30);
  
  stroke(23,44,60);
  fill(0, 90, 171, 200);
  rect(x, y, wid, heig);
  fill(0);
  textSize(15);
  text("birds location", x+25, y+12);
}

// Created by Shirley Wang
void habitatLegend(){
  int x = 20, y = 520 ;
  int wid = 20, heig = 15;
  int gap = 22 ;
  int transpr = 180;
  

//  int wid = 15;
//  int heig = 8;
  
  noStroke();
    // legend background box
  fill(255, 255, 255, 200);
  rect(x-5, y-5, 110, 75);
  // 'roost'
  fill(23, 50, 7, 200);
  rect(x, y, wid, heig);
  // territory
  fill(153, 77, 82, 200);
  rect(x, y+gap, wid, heig);
  // 'mudflats'
  fill(230, 180, 80, 200);
  //fill(230, 180, 80, 200);
  rect(x, y+gap*2, wid, heig);
  
  fill(0);
  textSize(15);
  text("Roost", x+wid+10, y+12);
  text("Territory", x+wid+10, y+12+gap*1);
  text("Mudflats", x+wid+10, y+12+gap*2);

  //textSize(17);
  //text("legend", 25, 517);
}

//Created by Shirley Wang
void dayNightLegend(){
  int x = 20, y = 520 ;
  int wid = 20, heig = 15;
  int gap = 22 ;
  // legend background box
  fill(255, 255, 255, 200);
  rect(15, 520, 100, 70);
  noStroke();
  // draw "day" triangle
  fill(0, 90, 171, 150);
  noStroke();
  rect(x, y+10, wid, heig);
 // triangle(30-6, 540, 30, 540-8, 30+6, 540);
  // draw "night" triangle
  fill(255, 222, 0, 150);
  noStroke();
  rect(x, y+gap+10, wid, heig);
 // triangle(30-6, 565, 30, 565-8, 30+6, 565);
  // draw legend text
  fill(0);
  textSize(15);
  text("Day", 48, 544);
  text("Night", 48, 569);
  //textSize(17);
  //text("legend", 25, 517);
}
