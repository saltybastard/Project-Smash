#define scr_AccDeacc
/// @description scr_AccDeacc(current,max,limit,amount a,amount b,valve a, valve b)
/// @param current
/// @param max
/// @param limit
/// @param amount a
/// @param amount b
/// @param valve a
/// @param valve b

// This script moves "current" towards "max" by "amount a" depending on "valve a" if valve a is not 0
// if valve a is 0, "current" moves toward "min" by "amount b" and a percentage of itself depending on "valve b"
// "current" cant overshoot past "max" but initialy can be higher than "max"

// "amount a" and "amount b" are constants
// "valve a" is designed to be an analog input with values from -1 to 1
// "valve b" is designed to be a constant rational number with values -1 to 1

var current = argument0;
var limit = argument2
var amount_a = argument3;
var amount_b = argument4;
var valve_a = argument5;
var valve_b = argument6;

if limit = true{
    var max_value = argument1 * abs(valve_a);
}else{
    var max_value = argument1;
}

//Max and overshoot
if abs(current) > max_value {
    var change = - sign(current) * amount_b;
    if sign(valve_a) + sign(current) = 0 {change += (amount_a + amount_b) * 2 * valve_a;}
    if abs(current) - abs(change) < max_value {return(sign(current) * (max_value - abs(current))); exit;}
    return(change); exit;
}

///Deaccelerate
if valve_a = 0 {
    if current = 0 {return(0); exit;}

    var change = - valve_b * current - amount_b * sign(current);
    if abs(current) < abs(change) {return(-current); exit;}
    return(change); exit;

}else{

///Accelerate
   if sign(valve_a) + sign(current) = 0 { var change = (amount_a + amount_b) * 2 * valve_a;
    }else{ var change = amount_a * valve_a; }

    if current + change >= max_value {return(sign(current) * (max_value - abs(current))); exit;}
    return(change);exit;
}

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