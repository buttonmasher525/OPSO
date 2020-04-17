// Input 

var k_left, k_left_pressed, k_right, k_right_pressed, k_up, k_down, k_jump, k_jumprelease, temp_accel, temp_fric;

k_left          = keyboard_check(vk_left);
k_left_pressed  = keyboard_check_pressed(vk_left);
k_right         = keyboard_check(vk_right);
k_right_pressed = keyboard_check_pressed(vk_right);
k_up            = keyboard_check(vk_up);
k_down          = keyboard_check(vk_down);

k_jump          = keyboard_check_pressed(ord("Z"));
k_jumprelease   = keyboard_check_released(ord("Z"));

// Movement

// apply correct form of accel and fric
if (onGround) {
	temp_accel = ground_accel;
	temp_fric  = ground_fric;
} else {
	temp_accel = air_accel;
	temp_fric  = air_fric;
}

// Reset wall cling
if ((!c_right && !c_left) || onGround) {
    canStick = true;
    sticking = false;
}   

// Cling to wall
if (((k_right && c_left) || (k_left && c_right)) && canStick && !onGround) {
    alarm[0] = cling_time;
    sticking = true; 
    canStick = false;       
}

// Handle gravity
if (!onGround) {
    if ((c_left || c_right) && vy >= 0) {
        // Wall slide
        vy = approach(vy, vy_max, grav_slide);
    } else {
        // Fall normally
        vy = approach(vy, vy_max, grav_norm);
    }
}

// Left 
if (k_left && !k_right && !sticking) {
    // Apply acceleration left
    if (vx > 0)
        vx = approach(vx, 0, temp_fric);   
    vx = approach(vx, -vx_max, temp_accel);
}

// Right 
if (k_right && !k_left && !sticking) {
    // Apply acceleration right
    if (vx < 0)
        vx = approach(vx, 0, temp_fric);   
    vx = approach(vx, vx_max, temp_accel);
}

// Friction
if (!k_right && !k_left)
    vx = approach(vx, 0, temp_fric); 

// Wall jump
if (alarm[0] = -1) {
	if (k_jump && c_left && !onGround) {
	    if (k_left) {
	        vy = -jump_height * 1.1;
	        vx =  jump_height * .75;
			alarm[0] = 50;
	    } else {
	        vy = -jump_height * 1.1;
	        vx =  vx_max;
	    }  
	}

	if (k_jump && c_right && !onGround) {
	    if (k_right) {
	        vy = -jump_height * 1.1;
	        vx = -jump_height * .75;
			alarm[0] = 50;
	    } else {
	        vy = -jump_height * 1.1;
	        vx = -vx_max;
	    }  
	}
}

// Jump 
if (k_jump) { 
    if (onGround)
        vy = -jump_height;
    // Variable jumping
} else if (k_jumprelease) { 
    if (vy < 0)
        vy *= 0.25;
}