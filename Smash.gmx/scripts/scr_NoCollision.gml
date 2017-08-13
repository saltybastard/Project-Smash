#define scr_NoCollision
/// @description scr_NoCollision(limit,vsnap,xtarg,ytarg)
/// @param limit
/// @param vsnap
/// @param xtarg
/// @param ytarg

//Making sure not to jump when no jump needs to be done

if argument_count = 4 {
    x = argument[2];
    y = argument[3];
}

var limit = argument[0];

if !place_meeting(x,y,obj_solid) and ((place_meeting(x,y+1,obj_solid) and argument[1]) or (!argument[1])) {exit;}

for (var gap = 0; gap <= limit; gap++) {
    for (var angle = 0; angle <= 360; angle += 5){

        var xtarg = x+lengthdir_x(gap,90 - angle);
        var ytarg = y+lengthdir_y(gap,90 - angle);

        if !place_meeting(xtarg,ytarg,obj_solid) {
            var gap = 0;
            
            if argument1 {
            
                if scr_NoJump(limit,xtarg,ytarg) {}
                else{
                x = xtarg;
                y = ytarg+gap;
                }
                exit;

            } else {
            x = xtarg;
            y = ytarg+gap;
            exit;
            }
            
        }

    }
}

#define scr_NoJump
/// @description scr_NoJump(limit,xtarg,ytarg)

var gap = 0;
var limit = argument0;

var xtarg = argument1
var ytarg = argument2;

if !place_meeting(xtarg,ytarg+1,obj_solid) and argument[1]{
    while !place_meeting(xtarg,ytarg+gap+1,obj_solid) and (gap++ < limit){}
    if gap = limit {gap = 0;}
    x = xtarg;
    y = ytarg+gap;
    return(true);
    exit;
} else {
    return(false);
    exit;
}



