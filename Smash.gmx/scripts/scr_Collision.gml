/// @description scr_Collision(place,object)
/// @param place
/// @param object

var limit = 16
scr_NoMeeting(limit,place = places.Ground);

switch(argument0)
{
    case places.Ground: {
/****************************************************************************************/
        ///Collision and Smooooth movement
        var xtarg = x+moveh;
        var ytarg = y+movev;
        
        if !place_meeting(xtarg,ytarg,obj_solid) and place_meeting(xtarg,ytarg+1,obj_solid){
            x = xtarg;
            y = ytarg;
            exit;
        }else{
        //Trying to climb up or down the enviroment
            var sweep_interval = 5;
            var dir = point_direction(0,0,moveh,movev);
            var spd = point_distance(0,0,moveh,movev);
            
            for ( var angle = sweep_interval; angle <= 45; angle += sweep_interval) { 
                for ( var multiplier = -1; multiplier <= 1; multiplier += 2) { 
                         
                        var angle_to_check = dir+angle*multiplier;
                        
                        var xtarg = x+lengthdir_x(spd, angle_to_check);
                        var ytarg = y+lengthdir_y(spd, angle_to_check);
                     
                        //moveh = lengthdir_x(spd, angle_to_check);
                        //movev = lengthdir_y(spd, angle_to_check);     //Causes bug
             
                        if !place_meeting(xtarg,ytarg,obj_solid) {
                            
                            if scr_NoJump(limit,xtarg,ytarg) {}
                            else{
                            x = xtarg;
                            y = ytarg;
                            }
                            exit;
                            
                        }
                    
                }
            }
        
        //Simply collide with wall
            while(!place_meeting(x+sign(moveh),y,obj_solid)){x +=sign(moveh);}
            moveh = 0
            exit;
        }
/****************************************************************************************/
    } break;
    case places.Air:  {
/****************************************************************************************/
        ///Rought Collision
        var xtarg = x+moveh
        var ytarg = y+movev
        
        if !place_meeting(xtarg,ytarg,obj_solid){
            x = xtarg;
            y = ytarg;
            exit;
        }else{
            //Horrisonal Collision
            if place_meeting(xtarg,y,obj_solid){
                while(!place_meeting(x+sign(moveh),y,obj_solid)){
                    x +=sign(moveh);
                }
                moveh = 0;
            }else x = xtarg;
            //Vertical Collision
            if place_meeting(x,ytarg,obj_solid){
                while(!place_meeting(x,y+sign(movev),obj_solid)){
                    y +=sign(movev);
                }
                movev = 0;
            }else y = ytarg;
            exit;
        }
/****************************************************************************************/
    }
}
