var seconds_passed = delta_time/1000000;

if place_meeting(x,y+1,obj_solid) {place = places.Ground; movev = 0;}
else {place = places.Air;}

switch (place)
{
    case places.Ground: {
        /****************************************************************************************/
        ///Accelerate, Deaccelerate
        moveh += scr_acc_deacc(ground_speed_max,ground_accelerating_speed,ground_deaccelerating_rate,moveh,inp_lsx) * seconds_passed;
        /****************************************************************************************/
        ///Jump
        if inp_buttd and !place_meeting(x+moveh*ground_jump_horisontal_reduction,y-ground_jump*seconds_passed,obj_solid){
            moveh += moveh*ground_jump_horisontal_reduction;
            movev -= ground_jump*seconds_passed; 
            
            var xtarg = x+moveh;
            var ytarg = y+movev;
            
            x = xtarg;
            y = ytarg;
            
            place = places.Air;
            exit;
        }
        /****************************************************************************************/
        ///Collision and Smooooth movement
            var xtarg = x+moveh;
            
            if !place_meeting(xtarg,y,obj_solid) and place_meeting(xtarg,y+1,obj_solid){
                x = xtarg;
                exit;
            }else{
            //Trying to climb up or down the enviroment
                var sweep_interval = 5;
                var dir = point_direction(0,0,moveh,0);
                
                for ( var angle = sweep_interval; angle <= 45; angle += sweep_interval) { 
                    for ( var multiplier = -1; multiplier <= 1; multiplier += 2) {      
                        var angle_to_check = dir+angle*multiplier;
                        var xtarg = x+lengthdir_x(moveh, angle_to_check)*sign(inp_lsx);
                        var ytarg = y+lengthdir_y(moveh, angle_to_check);     
                        
                        if !place_meeting(xtarg,ytarg,obj_solid) {
                            
                            /*****************************************************/
                            //Making sure not to jump when no jump needs to be done
                            var gap = 0
                            while !place_meeting(xtarg,ytarg+gap+1,obj_solid) and (gap < 10){
                                {gap += 1; audio_play_sound(sou_blip, 1, 0);}
                            }
                            if gap = 10 {gap = 0;}
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
    case places.Air: {
        /****************************************************************************************/
        ///Fly left or right
        moveh += scr_acc_deacc(air_speed_max,air_accelerating_speed,air_deaccelerating_rate,movev,inp_lsx) * seconds_passed;
        /****************************************************************************************/
        ///Fall
        movev += gravel * seconds_passed;
        
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
    } break;
    case places.Wall: break;
    case places.Edge: break;
}
