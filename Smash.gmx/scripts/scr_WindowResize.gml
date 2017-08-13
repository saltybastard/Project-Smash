/// @describtion scr_WindowResize()

var n = window_get_height()/window_get_width();
var m = room_height/room_width;
var o = 1

if n > m {
    view_hview[0] = abs(room_height * o);
    view_wview[0] = abs(room_height / n * o);
} else {
    view_hview[0] = abs(room_width * n * o);
    view_wview[0] = abs(room_width * o);
}
