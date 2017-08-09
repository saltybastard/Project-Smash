#define scr_NoJump
/// @description scr_NoJump(limit)
/// @param limit

//Making sure not to jump when no jump needs to be done

audio_play_sound(sou_blip,1,0)

var gap = 0;
var limit = argument0;
if place_meeting(x,y,obj_solid){
    while (--gap > -limit) and place_meeting(x,y+gap,obj_solid)
    if gap <= -limit {gap = 0;}
    return gap;
}
while (++gap < limit) and !place_meeting(x,y+gap+1,obj_solid) {}
if gap >= limit {gap = 0;}
return gap;

#define scr_NoWall
/// @description scr_NoWall(limit)
/// @param limit

var gap = 0;
//var limit = argument0;
var limit = 50;
if place_meeting(x,y,obj_solid){
    audio_play_sound(sou_blip,1,0)
    while (abs(gap) < limit) and place_meeting(x+gap,y,obj_solid)
    {gap += sign(gap); gap = -gap; }
    if abs(gap) >= limit {gap = 0;}
    return gap;
}
