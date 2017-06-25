/*
scr_input();
var seconds_passed = delta_time/1000000;
var move_speed_this_frame = move_speed*seconds_passed*point_distance(0,0,inp_lsx,inp_lsy);
var move_dir = point_direction(0,0,inp_lsx,inp_lsy);
scr_move(move_speed_this_frame,move_dir);
*/

/***************************************************
  Script has its uses when an object doesnt interact 
  with special forces such as gravity. See it as an 
  top down shooter that can never fall or be draged.
 ***************************************************/

/// @arg speed
/// @arg direction
 
var spd = argument0;
var dir = argument1;
 
var xtarg = x+lengthdir_x(spd,dir);
var ytarg = y+lengthdir_y(spd,dir);
 
if place_free(xtarg,ytarg) {
    x = xtarg;
    y = ytarg;
}
else {
    var sweep_interval = 10;
    
    for ( var angle = sweep_interval; angle <= 80; angle += sweep_interval) {
        for ( var multiplier = -1; multiplier <= 1; multiplier += 2) {      
            var angle_to_check = dir+angle*multiplier;
            xtarg = x+lengthdir_x(spd, angle_to_check);
            ytarg = y+lengthdir_y(spd, angle_to_check);     
            if place_free(xtarg,ytarg) {
                x = xtarg;
                y = ytarg;  
                exit;       
            }
        }
    }
}
