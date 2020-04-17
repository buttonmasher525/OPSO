// Inherit par_entity variables
event_inherited();

// Movement

// Multiplier
m = 1.0;

ground_accel    = 1.0  * m;
ground_fric     = 1.9  * m;
air_accel       = 0.75 * m;
air_fric        = 0.1  * m;
vx_max          = 6.5  * m;
vy_max          = 10.0 * m;
jump_height     = 8.0  * m;
grav_norm       = 0.5  * m;
grav_slide      = 0.25 * m;

cling_time      = 4.0  * m;

// Misc

// Relative collision checks
c_left  = place_meeting(x - 1, y, par_solid);
c_right = place_meeting(x + 1, y, par_solid);

// calc
sqrt2 = sqrt(2);