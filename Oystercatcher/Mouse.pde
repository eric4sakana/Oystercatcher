// if mouse is pressed
void mousePressed(){
  if (HideUI == true){
    HideUI_button =!HideUI_button;
    SideMenu_button=false;
  } 
  
  if(!HideUI_button){
    if(All_location ==true){
      Location_button =!Location_button;
    day_button=heatMap_button=habitat_button=Behavior_button=false;
    }
  else if(on_insBox){
    insBox_button =false;
  }
  else if(on_day){
    day_button =!day_button;
    heatMap_button=Behavior_button=habitat_button=Location_button=false;
    
  }
    
    else if(bird_1 == true ){
      //bird1 button clicked, load the point file of bird_1
      bird1_button =!bird1_button;
    
    } else if(bird_2 == true){
      bird2_button =!bird2_button;
     
    } else if(bird_3 == true){
      bird3_button =!bird3_button;
//     
    }
    // Simple way of displaying birds behavior.
      else if(All_behaviors == true){
      Behavior_button=!Behavior_button;
    day_button=heatMap_button=habitat_button=Location_button=false;
    } else if(All_habitat == true){
      habitat_button=!habitat_button;
    day_button=Location_button=Behavior_button=false;
    } 
    else if(all_birds == true){
    bird123_button=!bird123_button;    
    if(bird123_button ==true){
    bird1_button =bird2_button =bird3_button =true;
    }
    else 
    bird1_button =bird2_button =bird3_button =false;
  }
    else if(on_heatMap == true){
    heatMap_button=!heatMap_button;
    Location_button=day_button=Behavior_button=habitat_button=false;
  }
  
  }
  
 
  
  if(change_map==true){
    map_button=!map_button;
  }
  
  if(map_reset == true){
    reset_button=!reset_button;
  }
  else if (all_date){
    all_date_button =!all_date_button;
  }
}

//track the coordinates of cursor on interface
void mouselisten(int x, int y){
  
  if(overbird(start_x1+gap*2-10, start_y1-18, width_b, height_b) && !HideUI_button){
    All_location=true;
    cursor_over=1;
  }
  else if(overbird(start_x1+gap*3-10, start_y1+28-18, width_b, height_b) && !HideUI_button){
  on_day =true;
  cursor_over =1;  
  }

  else if(overbird(760, 70, 25, 15) && !HideUI_button && insBox_button){
  on_insBox =true;
  cursor_over =1;
  }
  else if(overbird(start_x2, start_y2, 90, 35) && !HideUI_button){
    cursor_over=1;
    bird_1 =true;
  } else if(overbird(start_x2+gap*1, start_y2, 90, 35) && !HideUI_button){
    //fill(50,50,50);
    // noStroke();
    //rect(5,295,110,30,6);
    cursor_over=1;
    bird_2 =true;
  } else if(overbird(start_x2+gap*2, start_y2, 90, 35) && !HideUI_button){
    //fill(50,50,50);
    //noStroke();
    //rect(5,335,110,30,6);
    cursor_over=1;
    bird_3 =true;
  } else if(overbird(start_x2+gap*3, start_y2, 90, 35) && !HideUI_button){

    cursor_over=1;
    all_birds =true;
  }
  else if(overbird(start_x1+gap*3-10, start_y1-18, width_b, height_b) && !HideUI_button){
  cursor_over =1;
  on_heatMap =true;
  }
    else if(overbird(start_x_3b - 8, start_y_3b + gap_3b*2 - 15, width_3b, height_3b)){
    cursor_over=1;
    HideUI =true;
  } else if (overbird(start_x1-10, start_y1-18, width_b, height_b) && !HideUI_button){
    All_behaviors=true;
    cursor_over=1;
  } 
    else if (overbird(start_x1+gap*1-10, start_y1-18, width_b, height_b) && !HideUI_button){
    All_habitat=true;
    cursor_over=1;
  }
    else if(overbird(start_x_3b - 8,start_y_3b + gap_3b - 15,width_3b,height_3b)){
    change_map=true;
    cursor_over=1;
  } 
  else if(overbird(start_x_3b - 8, start_y_3b - 15, width_3b, height_3b)){
    map_reset=true;
    cursor_over=1;
  }
  else {
    bird_1 =false;
    bird_2 =false;
    bird_3 =false;
    all_birds =false;
    SideButton =false;
    HideUI =false;
    cursor_over=0;
    All_behaviors =false;
    change_map=false;
    map_reset= false;
    All_location=false;
    All_habitat =false;
    on_heatMap =false;
    on_insBox=false;
    on_day =false;
  }            
  
  //anime_1=anime_2=anime_3=false;
  if(cursor_over==1){
    cursor(HAND);
  } else if(cursor_over==0){
    cursor(ARROW);
  }
}
