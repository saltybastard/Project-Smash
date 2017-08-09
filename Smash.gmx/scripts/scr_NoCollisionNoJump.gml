/// @description scr_NoJump(limit)
/// @param limit

//Making sure not to jump when no jump needs to be done
if !place_meeting(x,y,obj_solid) and place_meeting(x,y+1,obj_solid) {exit;}

var limit = argument0;

for (var gap = 0; gap <= limit; gap++) {
    for (var angle = 0; angle <= 360; angle += 5){

        var xtarg = x+lengthdir_x(gap,90 - angle);
        var ytarg = y+lengthdir_y(gap,90 - angle);

        if !place_meeting(xtarg,ytarg,obj_solid) {
            var gap = 0;
            
            if !place_meeting(xtarg,ytarg+1,obj_solid){
                audio_play_sound(sou_blip,1,0);
                while !place_meeting(xtarg,ytarg+gap+1,obj_solid) and (gap++ < limit){}
                
                global.gap = gap;
                
                if gap = limit {gap = 0;}
            }
            
            x = xtarg;
            y = ytarg+gap;
            exit;
        }

    }
}
