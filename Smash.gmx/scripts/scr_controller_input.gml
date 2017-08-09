#define scr_controller_input
//(Alt move) Dpad
inp_d[0] = gamepad_button_check(device,gp_padr);
inp_d[1] = gamepad_button_check(device,gp_padu);
inp_d[2] = gamepad_button_check(device,gp_padl);
inp_d[3] = gamepad_button_check(device,gp_padd);

if inp_d[0] or inp_d[1] or inp_d[2] or inp_d[3]{
    var dir = point_direction(0,0,inp_d[0]-inp_d[2],inp_d[3]-inp_d[1]);
    
    inp_xmove = lengthdir_x(1,dir);
    inp_ymove = lengthdir_y(1,dir);
}else {inp_xmove = 0; inp_ymove = 0;}

inp_dpressed[0] = gamepad_button_check_pressed(device,gp_padr);
inp_dpressed[1] = gamepad_button_check_pressed(device,gp_padu);
inp_dpressed[2] = gamepad_button_check_pressed(device,gp_padl);
inp_dpressed[3] = gamepad_button_check_pressed(device,gp_padd);

inp_dreleased[0] = gamepad_button_check_released(device,gp_padr);
inp_dreleased[1] = gamepad_button_check_released(device,gp_padu);
inp_dreleased[2] = gamepad_button_check_released(device,gp_padl);
inp_dreleased[3] = gamepad_button_check_released(device,gp_padd);

//(Move) Left stick 
inp_xmove = gamepad_axis_value(device,gp_axislh);
inp_ymove = gamepad_axis_value(device,gp_axislv);

///(Attack) Right stick
inp_xattack = gamepad_axis_value(device,gp_axisrh);
inp_yattack = gamepad_axis_value(device,gp_axisrv);

//Option
inp_menu = gamepad_button_check_pressed(device,gp_start);
inp_inv = gamepad_button_check_pressed(device,gp_select);

//Bkeys (4 colourd buttons)
inp_b[0] = gamepad_button_check(device,gp_face2);
inp_b[1] = gamepad_button_check(device,gp_face4);
inp_b[2] = gamepad_button_check(device,gp_face3);
inp_b[3] = gamepad_button_check(device,gp_face1);

inp_bpressed[0] = gamepad_button_check_pressed(device,gp_face2);
inp_bpressed[1] = gamepad_button_check_pressed(device,gp_face4);
inp_bpressed[2] = gamepad_button_check_pressed(device,gp_face3);
inp_bpressed[3] = gamepad_button_check_pressed(device,gp_face1);

inp_breleased[0] = gamepad_button_check_released(device,gp_face2);
inp_breleased[1] = gamepad_button_check_released(device,gp_face4);
inp_breleased[2] = gamepad_button_check_released(device,gp_face3);
inp_breleased[3] = gamepad_button_check_released(device,gp_face1);

//Triggers
inp_rtri = gamepad_axis_value(device,gp_shoulderrb);
inp_ltri = gamepad_axis_value(device,gp_shoulderlb);

//Flaps
inp_rflap = gamepad_axis_value(device,gp_shoulderr);
inp_lflap = gamepad_axis_value(device,gp_shoulderl);

#define scr_keyboard_input
//(Move) WASD keys
inp_d[0] = keyboard_check(ord('D'));
inp_d[1] = keyboard_check(ord('W'));
inp_d[2] = keyboard_check(ord('A'));
inp_d[3] = keyboard_check(ord('S'));

if inp_d[0] or inp_d[1] or inp_d[2] or inp_d[3]{
    var dir = point_direction(0,0,inp_d[0]-inp_d[2],inp_d[3]-inp_d[1]);

    inp_xmove = lengthdir_x(1,dir);
    inp_ymove = lengthdir_y(1,dir);
}else {inp_xmove = 0; inp_ymove = 0;}

//(Attack) QWER keys?
inp_attack[0] = keyboard_check(vk_left);
inp_attack[1] = keyboard_check(vk_up);
inp_attack[2] = keyboard_check(vk_right);
inp_attack[3] = keyboard_check(vk_down);

if inp_attack[0] or inp_attack[1] or inp_attack[2] or inp_attack[3]{
    var dir = point_direction(0,0,inp_attack[0]-inp_attack[2],inp_attack[3]-inp_attack[1]);

    inp_xattack = lengthdir_x(1,dir);
    inp_yattack = lengthdir_y(1,dir);
}
//(Alt move) Dkeys (?) //Wouldnt serve any purpose

//Option
inp_menu = keyboard_check(vk_escape);
inp_inv = keyboard_check(vk_tab);

//Bkeys (Action buttons)
inp_b[0] = keyboard_check(ord('Z')) or keyboard_check(vk_backspace);
inp_b[1] = keyboard_check(ord('X'));
inp_b[2] = keyboard_check(ord('C'));
inp_b[3] = keyboard_check(vk_space) or keyboard_check(vk_enter);

inp_bpressed[0] = keyboard_check_pressed(ord('Z')) or keyboard_check_pressed(vk_backspace);
inp_bpressed[1] = keyboard_check_pressed(ord('X'));
inp_bpressed[2] = keyboard_check_pressed(ord('C'));
inp_bpressed[3] = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter);

#define scr_mouse_input
//Binds mouse to controller buttons
inp_b[3] = mb_left;
inp_b[0] = mb_right;
inp_b[2] = mb_middle;

#define scr_input_zero
//(Alt move) Dpad
inp_d[0] = 0;
inp_d[1] = 0;
inp_d[2] = 0;
inp_d[3] = 0;

//(Move) Left stick 
inp_xmove = 0;
inp_ymove = 0;

///(Attack) Right stick
inp_xattack = 0;
inp_yattack = 0;

//Option
inp_menu = 0;
inp_inv = 0;

//Bkeys (4 colourd buttons)
inp_b[0] = 0;
inp_b[1] = 0;
inp_b[2] = 0;
inp_b[3] = 0;

//Triggers
inp_rtri = 0;
inp_ltri = 0;

//Flaps
inp_rflap = 0;
inp_lflap = 0;

//(Attack) QWER keys?
inp_attack[0] = 0;
inp_attack[1] = 0;
inp_attack[2] = 0;
inp_attack[3] = 0;

//Mouse
mousex = mouse_x;
mousey = mouse_y;

#define scr_input_interpreter
/***************************************************
  This script is used to notice special combinations
  of input and translate into others. This can be
  used by all heros and doesnt cover special attacks.
 ***************************************************/
 
 
#define scr_input_shift
var input
if keyboard_check(vk_anykey) input = "keyboard";
else input = "gamepad";

switch(input){
    case "keyboard": scr_keyboard_input(); break;
    case "gamepad": scr_controller_input(); break;
}

#define scr_mouse_moving
if mouse_x == mousex && mouse_y == mousey return false;
else mousex = mouse_x; mousey = mouse_y; return true;

#define scr_controller_using
scr_controller_input();
//Check ALL the inputs
if inp_d[0] or inp_d[1] or inp_d[2] or inp_d[3]
or inp_xmove or inp_ymove or inp_xattack or inp_yattack
or inp_inv or inp_menu
or inp_b[0] or inp_b[1] or inp_b[2] or inp_b[3]
or inp_rtri or inp_ltri or inp_rflap or inp_lflap
return(true) else return (false)