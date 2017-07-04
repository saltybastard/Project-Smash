#define scr_acc_deacc
var speed_max = argument0;
var accelerating_speed = argument1;
var deaccelerating_rate = argument2;
var deaccelerating_speed = argument3;

var move = argument4;
var input = argument5;

///Deaccelerate
    if input = 0 {
        if move = 0 {return(0); exit;}
        var deacc = deaccelerating_rate * move + deaccelerating_speed * sign(move);
        var change_speed = -deacc;
        if abs(move) < abs(change_speed) {change_speed = -move;}
        
///Accelerate
    }else{
       if sign(input) + sign(move) = 0 {
            var acc = (accelerating_speed + deaccelerating_speed) * 2 * input;
        }else{
            var acc = accelerating_speed * input;
        }

        //Controll
        if acc >= speed_max * abs(input) {acc = speed_max * abs(input)}

        //Apply and controll
        var change_speed = acc;
        if abs(move) >= speed_max {change_speed = sign(move) * (speed_max - abs(move));} 
    }

return(change_speed);

#define scr_collision
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
                        
                            /*****************************************************/
                            //Making sure not to jump when no jump needs to be done
                            var gap = 0;
                            var limit = 5;
                            while !place_meeting(xtarg,ytarg+gap+1,obj_solid) and (gap < limit){
                                gap += 1;
                            }
                            if gap = limit {gap = 0;}
                            /*****************************************************/
                            
                            x = xtarg;
                            y = ytarg+gap;
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