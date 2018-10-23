//Created by Sam. this function create title, source and descriptions for basemap
void descriptiveText(){
  PFont titleFont = createFont("SansSerif",18);
  PFont subtitleFont = createFont("SansSerif",14);
  PFont citationFont = createFont("SansSerif",10);
  PFont buttonFont = createFont("SansSerif",15);
  String title = "Tracking and Classifying Oystercatcher (Haematopus Ostralegus) Behaviour";
  String subtitle = "on the island of Schiermonnikoog, the Netherlands (53.29N, 06.10E)"+
      " - A case study of Animal Behaviour using animal-borne sensors";
  String methodology = "By using a GPS tracking system combined with visual observations of the birds' behaviour." + 
      " The behaviors are classified based on tracked speed and accelerometer.";
  String citation = "Source: Shamoun-Baranes J, Bom R, van Loon EE, Ens BJ, Oosterbeek K, et al. (2012). "
      + "From Sensor Data \nto Animal Behaviour: An Oystercatcher Example." +
      " PLoS ONE 7(5): e37997. doi:10.1371/journal.pone.0037997";
  String credential = "This visualisation project is developed by Sam Ath TRY, Xiaoxue WANG, Yifan LIU" +
      "\nas the major project for the GEOM90007 Spatial Visualization in Semester 2, 2018." ;
  image(img_om, width-165, height-205, 160, 160);  // at bottom left
  
  // draw title and subtitle
   
    fill(0);


  textAlign(CENTER);
  textFont(titleFont);
  text(title, width/2, 30);
  textFont(subtitleFont);
  text(subtitle, width/2, 50);
  
  // draw citation and credential
  textFont(citationFont);
  textAlign(LEFT);
  textLeading(15);
  text(citation, 20, height-25);        
  text(credential, width-380, height-25);
}

// this is the description function, display intended description text
void description(int x){
  int y=x;
  fill(0,0,0);
    //buttons
  String bu1="Bird ID 166";      //SAM_20181012_1
  String bu2="Bird ID 167";      //SAM_20181012_1
  String bu3="Bird ID 169";      //SAM_20181012_1
  String bu4="All movement";      //SAM_20181012_1
  String bu5="Animation 2";
  String bu6="Behaviors";    //SAM_20181012_1
  
  String b1 = "Showing locations of " + bu1 + " between " + date_range;
  String b2 = "Showing locations of " + bu2 + " between " + date_range ;
  String b3 = "Showing locations of " + bu3 + " between " + date_range ;
  String b12 = "Showing locations of " + bu1 + ", " + bu2 + " between " + date_range ;
  String b23 = "Showing locations of " + bu2 + ", " + bu3 + " between " + date_range ;
  String b13 = "Showing locations of " + bu1 + ", " + bu3 + " between " + date_range ;
  String b123 = "Showing locations of " + bu1 + ", " + bu2 + ", " + bu3 + " between " + date_range ;
  
   //habitat
  String h1 = "Showing locations and habitat of " + bu1 + " between " + date_range;
  String h2 = "Showing locations and habitat of " + bu2 + " between " + date_range ;
  String h3 = "Showing locations and habitat of " + bu3 + " between " + date_range ;
  String h12 = "Showing locations and habitat of " + bu1 + ", " + bu2 + " between " + date_range ;
  String h23 = "Showing locations and habitat of " + bu2 + ", " + bu3 + " between " + date_range ;
  String h13 = "Showing locations and habitat of " + bu1 + ", " + bu3 + " between " + date_range ;
  String h123 = "Showing habitat of " + bu1 + ", " + bu2 + ", " + bu3 + " between " + date_range ;
  String a1 = "Showing all habitat record of the bird";
  String a2 = "Showing the heatMap";
  String a3 = "Showing all behaviours of the bird.";
  int a_x = 430, a_y = 580;
  //behaviors
  String be1 = "Showing locations and behaviors of " + bu1 + " between " + date_range;
  String be2 = "Showing locations and behaviors of " + bu2 + " between " + date_range ;
  String be3 = "Showing locations and behaviors of " + bu3 + " between " + date_range ;
  String be12 = "Showing locations and behaviors of " + bu1 + ", " + bu2 + " between " + date_range ;
  String be23 = "Showing locations and behaviors of " + bu2 + ", " + bu3 + " between " + date_range ;
  String be13 = "Showing locations and behaviors of " + bu1 + ", " + bu3 + " between " + date_range ;
  String be123 = "Showing locations and behaviors of " + bu1 + ", " + bu2 + ", " + bu3 + " between " + date_range ;
  
  //day and night
  String dn1 = "Showing locations and diurnal variation of " + bu1 + " between " + date_range;
  String dn2 = "Showing locations and diurnal variation of " + bu2 + " between " + date_range ;
  String dn3 = "Showing locations and diurnal variation of " + bu3 + " between " + date_range ;
  String dn12 = "Showing locations and diurnal variation of " + bu1 + ", " + bu2 + " between " + date_range ;
  String dn23 = "Showing locations and diurnal variation of " + bu2 + ", " + bu3 + " between " + date_range ;
  String dn13 = "Showing locations and diurnal variation of " + bu1 + ", " + bu3 + " between " + date_range ;
  String dn123 = "Showing locations and diurnal variation of " + bu1 + ", " + bu2 + ", " + bu3 + " between " + date_range ;
  //when floating on buttons
  String float_1 = "Show locations of " + bu1;    //SAM_20181012_1
  String float_2 = "Show locations of " + bu2;    //SAM_20181012_1
  String float_3 = "Show locations of " + bu3;    //SAM_20181012_1
  String float_6 = "Showing locations and behaviors of all the birds";    //SAM_20181012_1
  
  //SAM_20181012_3 : modified x.   y need to be set with black box height
  int bird1_x=15, bird1_y=257;  //draw record buttons  //SAM_20181012_3
  int bird1_wid=110,bird1_hei=36;  //SAM_20181012_3
  int bird2_x=15,bird2_y=297;  //SAM_20181012_3
  int bird3_x=15,bird3_y=337;  //SAM_20181012_3
  
  int anime1_x=15, anime1_y=377;  //draw animation buttons  //SAM_20181012_3
  int anime2_x=15,anime2_y=417;  //SAM_20181012_3
  int anime3_x=15,anime3_y=457;  //SAM_20181012_3
  
  PFont textFont = createFont("SansSerif", 11);  // SAM_20181012_3
  textFont(textFont);
  
  int buttonTxtSize = 11; // SAM_20181012_3
  int mouseOnTxtSize = 11; // SAM_20181012_3
  textSize(11);
  
  switch(y){     
    //case 0:
    //  text(d1,330,580,320,100);
     // break;
    case 1:
      text(b1,425, 560, 355, 60);
      break;
    case 2:
      text(b2,425, 560, 355, 60);
      break;
    case 3:
      text(b3,425, 560, 355, 60);
      break;
    case 4:
      text(b12,425, 560, 355, 60);
      break;
    case 5:
      text(b23,425, 560, 355, 60);
      break;
    case 6:
      text(b13,425, 560, 355, 60);
      break;
    case 7:
      text(b123,425, 560, 355, 60);
      break;
   // case 8:
    //  fill(0,0,0);
    //  textSize(16);
    //  text(t1,330,580,320,100);
     // break;
    case 9:              // SAM_20181012_3 : label in control.
      text(a1,425, 560, 355, 60);
      break;
    case 10:
    textSize(11);
      text(a3,425, 560, 355, 60);
      break;
    case 11:
      textSize(buttonTxtSize);  // SAM_20181012_3
      text(bu3,bird3_x,bird3_y,bird1_wid,bird1_hei);
      break;
    case 12:
      textSize(buttonTxtSize);  // SAM_20181012_3
      text(bu4,anime1_x,anime1_y,bird1_wid,bird1_hei);
      break;
    case 13:
      textSize(buttonTxtSize);  // SAM_20181012_3
      text(bu5,anime2_x,anime2_y,bird1_wid,bird1_hei);
      break;
    case 14:
      fill(0,0,0);
      textSize(buttonTxtSize);  // SAM_20181012_3
      text(bu6,anime3_x,anime3_y,bird1_wid,bird1_hei);
      break;
    case 15:    //if cursor is floating on a button, display some instruction words
      textSize(11);
      fill(0,0,0);
      text(h1,425, 560, 355, 60);
      break;
    case 16:
      textSize(11);
      fill(0,0,0);
      text(h2,425, 560, 355, 60);
      break;
    case 17:
      textSize(11);
      fill(0,0,0);
      text(h3,425, 560, 355, 60);
      break;
     case 18:
      text(h12,425, 560, 355, 60);
      break; 
    // text when mouse hovering on
    case 19:
      text(h23,425, 560, 355, 60);
      break;
    case 20:
      text(h123,425, 560, 355, 60);
      break;
    case 21:
      text(h13,425, 560, 355, 60);
      break;
    case 22:
      text(h123,425, 560, 355, 60);
      break; 
    case 23:
      textSize(16);
      fill(0,0,0);
      text(float_6,330,580,320,100);
      break;
    case 24:
      textSize(16);
      fill(0,0,0);
      text(a3, a_x, a_y);
      break;
   case 25:
      text(be1,425, 560, 355, 60);
      break;
   case 26:
      text(be2,425, 560, 355, 60);
      break;
   case 27:
      text(be3,425, 560, 355, 60);
      break;
   case 28:
      text(be12,425, 560, 355, 60);
      break;
   case 29:
      text(be13,425, 560, 355, 60);
      break;
   case 30:
      text(be123,425, 560, 355, 60);
      break;
   case 31:
      text(be23,425, 560, 355, 60);
      break;
   case 32:
      text(dn1,425, 560, 355, 40);
      break; 
   case 33:
      text(dn2,425, 560, 355, 40);
      break; 
   case 34:
      text(dn3,425, 560, 355, 40);
      break; 
   case 35:
      text(dn12,425, 560, 355, 40);
      break; 
   case 36:
      text(dn13,425, 560, 355, 40);
      break; 
   case 37:
      text(dn23,425, 560, 355, 40);
      break; 
   case 38:
      text(dn123,425, 560, 355, 40);
      break; 
  }
}


