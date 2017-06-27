//Left stick (Move)
inp_xmove = gamepad_axis_value(device,gp_axislh);
inp_ymove = gamepad_axis_value(device,gp_axislv);
///Right stick (Attack)
inp_xattack = gamepad_axis_value(device,gp_axisrh);
inp_yattack = gamepad_axis_value(device,gp_axisrh);
//Dpad
inp_d[0] = gamepad_button_check(device,gp_padr);
inp_d[1] = gamepad_button_check(device,gp_padu);
inp_d[2] = gamepad_button_check(device,gp_padd);
inp_d[3] = gamepad_button_check(device,gp_padl);
//Option
inp_menu = gamepad_button_check_pressed(device,gp_start);
inp_inv = gamepad_button_check_pressed(device,gp_select);
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
