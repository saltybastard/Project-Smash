var seconds_passed = delta_time/1000000;

if place_meeting(x,y+1,obj_solid) {place = places.Ground; movev = 0;}
else {place = places.Air;}

switch (place)
{
    case places.Ground: {
/****************************************************************************************/
        ///Accelerate, Deaccelerate
        moveh += scr_acc_deacc(ground_spd_max,ground_acc_spd,ground_deacc_rate,ground_deacc_spd,
        moveh/seconds_passed,inp_xmove) * seconds_passed;

        ///Jump
        if inp_b[3] and !place_meeting(x+moveh*ground_jump_xreduct,y-ground_jump*seconds_passed,obj_solid){
            moveh += moveh*ground_jump_xreduct;
            movev -= ground_jump*seconds_passed; 
            
            var xtarg = x+moveh;
            var ytarg = y+movev;
            
            x = xtarg;
            y = ytarg;
            
            place = places.Air;
            exit;
        }

        scr_collision(places.Ground);
/****************************************************************************************/
    } break;
    case places.Air: {
/****************************************************************************************/
        ///Fly left or right
        moveh += scr_acc_deacc(air_spd_max,air_acc_spd,air_deacc_rate,air_deacc_spd,
        moveh/seconds_passed,inp_xmove) * seconds_passed;

        ///Fall
        movev += gravel*seconds_passed;
        if !inp_b[3] {
            if movev < 0 {movev = max(movev,-ground_jump/2*seconds_passed);}
            if movev > 10 { movev += gravel * seconds_passed;}
        } else {
            movev = min(movev,hover_speed*seconds_passed);
        }
        if 2 > movev and movev > -2 { movev += gravel * seconds_passed;}
        
        
        
        scr_collision(places.Air);
/****************************************************************************************/
    } break;
    case places.Wall: break;
    case places.Edge: break;
}
