var speed_max = argument0;
var accelerating_speed = argument1;
var deaccelerating_rate = argument2;

var move = argument3;
var input = argument4;

///Accelerate
    if input != 0 {
        if sign(input) + sign(move) = 0 {
            var acc = (accelerating_speed + deaccelerating_rate) * input;
        }else{
            var acc = accelerating_speed * input;
        }

        //Controll
        if acc >= speed_max * abs(input) {acc = speed_max * abs(input)}

        //Apply and controll
        var change_speed = acc;
        if abs(move) >= speed_max {change_speed = sign(move) * (speed_max - abs(move));}

///Deaccelerate
    }else{
        var deacc = move * deaccelerating_rate;
        var change_speed = -deacc;
    }

return(change_speed);
