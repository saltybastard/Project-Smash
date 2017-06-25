switch (place){
    case places.Ground: scr_move_her0(); break;
    case places.Air: scr_move_her0(); break;
    case places.Wall: break;
    case places.Edge: break;
}

if place_meeting(x,y+1,obj_solid) {place = places.Ground;}
else {place = places.Air;}
