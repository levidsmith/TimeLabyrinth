/// @description Insert description here
// You can write your code in this editor


if (iIntroDelay > 0) {
	iIntroDelay -= 1
	
	if (iIntroDelay == 0) {
		audio_play_sound(sndTitleText,1,0)
	}
}

if (keyboard_check_pressed(vk_space)) {
	randomize()
	global.iTimeRemaining = 60 * game_get_speed(gamespeed_fps)
	global.iLevel = 0
	
	global.color_ids = [0, 1, 2, 3, 4 , 5, 6, 7]
	global.color_ids = array_shuffle(global.color_ids)

	global.level_format_ids = [0, 1, 2, 3, 4 , 5, 6, 7, 8, 9, 10, 11]
//	global.level_format_ids = array_shuffle(global.level_format_ids)


	room_goto(RoomGame)	
}

if (keyboard_check_pressed(vk_escape)) {
	game_end()
}