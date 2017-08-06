/// @description Center(object, x1, y1, x2, y2)
/// @param object
/// @param x1
/// @param y1
/// @param x2
/// @param y2

// Centers self in the middle of the screen or
// Centers a different object in the middle of the screen or
// Teleports it to a position or
// Centers it in a box inside a box

// Use 0, 1, 3, or 5 arguments for script to work

if argument_count = 0{
    x = room_width/2
    y = room_height/2
    exit;
} else if argument_count = 1{
    with(argument[0]){
    x = room_width/2
    y = room_height/2
    }exit;
}else if argument_count = 3{
    with(argument[0]){
    x = argument[1]
    y = argument[2]
    }exit;
} else if argument_count = 5{
    with(argument[0]){
    x = (argument[1]+argument[3]) / 2
    y = (argument[2]+argument[4]) / 2
    }exit;
}
