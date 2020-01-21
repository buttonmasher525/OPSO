/// @description Current Room

// Display current room
draw_set_font(0);
draw_set_color(c_white);
draw_text(x, y, string("Room: " + string(room_get_name(room))));
