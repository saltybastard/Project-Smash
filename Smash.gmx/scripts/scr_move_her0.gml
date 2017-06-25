var seconds_passed = delta_time/1000000;

switch (place)
{
    case places.Ground: {
    /*******************/    
            if ceil(abs(inp_lsx)) {
                if sign(inp_lsx) + sign(hspdf) = 0 {
                    var acc = ground_speed_max * (ground_accelerating_rate + ground_deaccelerating_rate) * inp_lsx;
                }else{
                    var acc = ground_speed_max * ground_accelerating_rate * inp_lsx;
                }
                
                if acc >= ground_speed_max * abs(inp_lsx) {acc = ground_speed_max * abs(inp_lsx)}
                hspdf += acc * seconds_passed;
                
                if abs(hspdf) >= ground_speed_max {hspdf = ground_speed_max * sign(hspdf)}
            }else{
                var deacc = hspdf * ground_deaccelerating_rate;
                hspdf -= deacc;
            }

            //Smooth Hard collision wombo combo
            if place_meeting(x+hspdf,y,obj_solid){
                while(!place_meeting(x+sign(hspdf),y,obj_solid)){
                x +=sign(hspdf);
                }
                hspd = 0;
            }
            
            
        } break;
    case places.Air: {
    /****************/
            vspd += gravel
            
            //Vertical collision
            if place_meeting(x+hspdf,y+vspd,obj_solid){
                while(!place_meeting(x+sign(hspdf),y+sign(vspd),obj_solid)){
                x +=sign(hspdf);
                y +=sign(vspd);
                }
                vspd = 0;
            }
            
        } break;
    case places.Wall: break;
    case places.Edge: break;
}

hspeed = hspdf;
vspeed = vspd;

if place_meeting(x,y+1,obj_solid) {place = places.Ground;}
else {place = places.Air;}
