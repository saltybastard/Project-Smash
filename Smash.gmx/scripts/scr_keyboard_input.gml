//WASD keys (Move)
inp_move[0] = keyboard_check(ord('D'));
inp_move[1] = keyboard_check(ord('W'));
inp_move[2] = keyboard_check(ord('A'));
inp_move[3] = keyboard_check(ord('S'));

var dir = point_direction(0,0,inp_move[0]-inp_move[2],inp_move[1]-inp_move[3]);

inp_xmove = lengthdir_x(1,dir);
inp_ymove = lengthdir_y(1,dir);

//QWER keys? (Attack)
inp_attack[0] = keyboard_check(ord('?'));
inp_attack[1] = keyboard_check(ord('?'));
inp_attack[2] = keyboard_check(ord('?'));
inp_attack[3] = keyboard_check(ord('?'));

var dir = point_direction(0,0,inp_attack[0]-inp_attack[2],inp_attack[1]-inp_attack[3]);

inp_xattack = lengthdir_x(1,dir);
inp_yattack = lengthdir_y(1,dir);

//Dkeys (?)
inp_d[0] = keyboard_check(ord('?'));
inp_d[1] = keyboard_check(ord('?'));
inp_d[2] = keyboard_check(ord('?'));
inp_d[3] = keyboard_check(ord('?'));

//Option
inp_menu = keyboard_check(vk_escape);
inp_inv = keyboard_check(ord('?'));

//Bkeys (Action buttons)
inp_b[0] = keyboard_check(ord('?'));
inp_b[1] = keyboard_check(ord('?'));
inp_b[2] = keyboard_check(ord('?'));
inp_b[3] = keyboard_check(ord('?'));

