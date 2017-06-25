hspd_final = hspd + hspd_push
var vspd_final = vspd + vspd_push

hspd_push = 0;
vspd_push = 0;

if abs(hspd_final) >= 7 { hspd_final = 7 * sign(hspd_final);}
if abs(vspd_final) >= 7 { vspd_final = 7 * sign(vspd_final);}

//Horisontal collision
if place_meeting(x+hspd_final,y,obj_solid){
    if !place_meeting(x+hspd_final,y-8,obj_solid) and place_meeting(x,y+1,obj_solid){
        x+= sign(hspd_final);
        y+= -8;
    }
    else{
        while(!place_meeting(x+sign(hspd_final),y,obj_solid)){
        x +=sign(hspd_final);
        }
        jcount = jcountres;
        hspd = 0;
        hspd_final = 0;
    }
}

//Vertical collision
if place_meeting(x+hspd_final,y+vspd_final,obj_solid){
    while(!place_meeting(x+sign(hspd_final),y+sign(vspd_final),obj_solid)){
    x +=sign(hspd_final);
    y +=sign(vspd_final);
    }
    vspd = 0;
    vspd_final = 0;
}

//Get unstuck
if place_meeting(x,y,obj_solid){
    vspd_final = -3
}

hspeed = hspd_final
vspeed = vspd_final

hspd_final = 0
vspd_final = 0
