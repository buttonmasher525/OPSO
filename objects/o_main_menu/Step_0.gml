/// @description Menu Navigation

// note: replace these controls with a global control script for player chosen controls
menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up) 

// allows player to move the selected menu option
menu_index += menu_move;

// loops back to the first menu option
if (menu_index < 0) menu_index = buttons - 1; 
if (menu_index > buttons -1) menu_index = 0;

if (menu_index != last_selected) audio_play_sound(snd_menu_switch, 1, false);

last_selected = menu_index;

if (keyboard_check_pressed(vk_enter)) {
	switch (menu_index) {
		case 0:
			room_goto_next();
			break;
		case 4:
			game_end();
	}
}