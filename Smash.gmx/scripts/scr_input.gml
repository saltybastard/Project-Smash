//Left stick
inp_lsx = gamepad_axis_value(device,gp_axislh);
inp_lsy = gamepad_axis_value(device,gp_axislv);
///Right stick
inp_rsx = gamepad_axis_value(device,gp_axisrh);
inp_rsy = gamepad_axis_value(device,gp_axisrh);
//Dpad
inp_du = gamepad_button_check(device,gp_padu);
inp_dr = gamepad_button_check(device,gp_padr);
inp_dd = gamepad_button_check(device,gp_padd);
inp_dl = gamepad_button_check(device,gp_padl);
//Option
inp_start = gamepad_button_check_pressed(device,gp_start) or keyboard_check_pressed(vk_escape);
inp_select = gamepad_button_check_pressed(device,gp_select);
//Buttons
inp_buttu = gamepad_button_check(device,gp_face4);
inp_buttr = gamepad_button_check(device,gp_face2);
inp_buttd = gamepad_button_check(device,gp_face1);
inp_buttl = gamepad_button_check(device,gp_face3);
//Triggers
inp_trir = gamepad_axis_value(device,gp_shoulderrb);
inp_tril = gamepad_axis_value(device,gp_shoulderlb);
//Flaps
inp_flapr = gamepad_axis_value(device,gp_shoulderr);
inp_flapl = gamepad_axis_value(device,gp_shoulderl);
