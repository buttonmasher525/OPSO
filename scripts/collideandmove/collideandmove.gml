// @func "collideandmove();"
// @desc collision movement physics for all entities
// place this script in the end step event

var vxNew, vyNew;

// Handle sub-pixel movement
cx += vx;
cy += vy;
vxNew = round(cx);
vyNew = round(cy);
cx -= vxNew;
cy -= vyNew;

// Vertical
repeat(abs(vy)) {
    if (!place_meeting(x, y + sign(vy), par_solid))
        y += sign(vy); 
    else {
        vy = 0;
        break;
    }
}

// Horizontal
repeat(abs(vx)) {
    // Move up slope
    if (place_meeting(x + sign(vx), y, par_solid) && place_meeting(x + sign(vx), y - 1, par_solid) && !place_meeting(x + sign(vx), y - 2, par_solid))
        y -= 2;
    else if (place_meeting(x + sign(vx), y, par_solid) && !place_meeting(x + sign(vx), y - 1, par_solid))
        --y;
    
    // Move down slope
    if (!place_meeting(x + sign(vx), y, par_solid) && !place_meeting(x + sign(vx), y + 1, par_solid) && !place_meeting(x + sign(vx), y + 2, par_solid) && place_meeting(x + sign(vx), y + 3, par_solid))
        y += 2;
    else if (!place_meeting(x + sign(vx), y, par_solid) && !place_meeting(x + sign(vx), y + 1, par_solid) && place_meeting(x + sign(vx), y + 2, par_solid))
        ++y; 

    if (!place_meeting(x + sign(vx), y, par_solid))
        x += sign(vx); 
    else {
        vx = 0;
        break;
    }
}