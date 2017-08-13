/// @description scr_AccDeacc(current,max,limit,amount a,amount b,valve a, valve b, timesync)
/// @param current
/// @param max
/// @param limit
/// @param amount a
/// @param amount b
/// @param valve a
/// @param valve b
/// @param timesync

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
var timesync = argument7;

var current_timesync = current / timesync;

if limit = true{
    var max_value = argument1 * abs(valve_a);
}else{
    var max_value = argument1;
}

//Max and overshoot
if abs(current_timesync) > max_value {
    var change = - sign(current_timesync) * amount_b;
    if sign(valve_a) + sign(current) = 0 {change += (amount_a + amount_b) * 2 * valve_a;}
    if abs(current_timesync) - abs(change) < max_value {return(timesync * sign(current_timesync) * (max_value - abs(current_timesync))); exit;}
    return(timesync * change); exit;
}

///Deaccelerate
if valve_a = 0 {
    if current_timesync = 0 {return(0); exit;}

    var change = - valve_b * current - amount_b * sign(current_timesync);
    if abs(current_timesync) < abs(change) {return(timesync * -current_timesync); exit;}
    return(timesync * change); exit;

}else{

///Accelerate
   if sign(valve_a) + sign(current_timesync) = 0 { var change = (amount_a + amount_b) * 2 * valve_a;
    }else{ var change = amount_a * valve_a; }

    if current_timesync + change >= max_value {return(timesync * sign(current_timesync) * (max_value - abs(current_timesync))); exit;}
    return(timesync * change);exit;
}
