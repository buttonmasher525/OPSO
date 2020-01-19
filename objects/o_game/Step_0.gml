/// @description Game Controller

// Room iteration debug

var k_end, k_reset, k_back, k_forward;

k_end = keyboard_check(vk_escape);
k_reset = keyboard_check(vk_home);
k_back = keyboard_check(vk_subtract);
k_forward = keyboard_check(vk_add);

// End Game
if k_end game_end();

// Reset Game
if k_reset game_restart();

// Iterate through game rooms backwards
if (k_back) {
	if (room = room_first) {
		room_goto(room_last);
	} else {
		room_goto_previous();
	}
}

// Iterate through game rooms forwards
if (k_forward) {
	if (room = room_last) {
		room_goto(room_last);
	} else {
		room_goto_previous();
	}
}

