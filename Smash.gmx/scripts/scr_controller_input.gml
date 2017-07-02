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
}//Is overitten by:

//(Move) Left stick 
inp_xmove = gamepad_axis_value(device,gp_axislh);
inp_ymove = gamepad_axis_value(device,gp_axislv);

///(Attack) Right stick
inp_xattack = gamepad_axis_value(device,gp_axisrh);
inp_yattack = gamepad_axis_value(device,gp_axisrh);

//Option
inp_menu = gamepad_button_check_pressed(device,gp_start);
inp_inv = gamepad_button_check_pressed(device,gp_select);

//Bkeys (4 colourd buttons)
inp_b[0] = gamepad_button_check(device,gp_face2);
inp_b[1] = gamepad_button_check(device,gp_face4);
inp_b[2] = gamepad_button_check(device,gp_face3);
inp_b[3] = gamepad_button_check(device,gp_face1);

//Triggers
inp_rtri = gamepad_axis_value(device,gp_shoulderrb);
inp_ltri = gamepad_axis_value(device,gp_shoulderlb);

//Flaps
inp_rflap = gamepad_axis_value(device,gp_shoulderr);
inp_lflap = gamepad_axis_value(device,gp_shoulderl);

#define scr_keyboard_input
//(Move) WASD keys
inp_move[0] = keyboard_check(ord('D'));
inp_move[1] = keyboard_check(ord('W'));
inp_move[2] = keyboard_check(ord('A'));
inp_move[3] = keyboard_check(ord('S'));

if inp_move[0] or inp_move[1] or inp_move[2] or inp_move[3]{
    var dir = point_direction(0,0,inp_move[0]-inp_move[2],inp_move[3]-inp_move[1]);

    inp_xmove = lengthdir_x(1,dir);
    inp_ymove = lengthdir_y(1,dir);
}

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
inp_b[0] = keyboard_check(ord('Z'));
inp_b[1] = keyboard_check(ord('X'));
inp_b[2] = keyboard_check(ord('C'));
inp_b[3] = keyboard_check(vk_space);
#define scr_input_interpreter
/***************************************************
  This script is used to notice special combinations
  of input and translate into others. This can be
  used by all heros and doesnt cover special attacks.
 ***************************************************/
 
 