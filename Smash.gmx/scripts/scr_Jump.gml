///@description scr_Jump(xmultiplier,yadder,timesync)
///@param xmultiplier
///@param yadder
///@param timesync

//This script was first used to slow down the players horisontal momentum
//And to kickstart the vertical momentum
//However xmultiplier can also speed up the horisontal momentum

if !place_meeting(x+moveh*argument0,y-argument1*argument2,obj_solid){
    moveh += moveh*argument0;
    movev -= argument1*argument2; 
    
    var xtarg = x+moveh;
    var ytarg = y+movev;
    
    x = xtarg;
    y = ytarg;
    
    place = places.Air;
}
