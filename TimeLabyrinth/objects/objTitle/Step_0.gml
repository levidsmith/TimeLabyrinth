/// @description Insert description here
// You can write your code in this editor


if (iIntroDelay > 0) {
	iIntroDelay -= 1
	
	if (iIntroDelay == 0) {
		audio_play_sound(sndTitleText,1,0)
		iResetDelay = iMaxResetDelay
	}
} else if (iResetDelay > 0) {
	iResetDelay -= 1
	if (iResetDelay == 0) {
		iIntroDelay = iMaxIntroDelay	
	}
}

if (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(ord("X")) ) {
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

title_bkg_y_offset -= 1
if (title_bkg_y_offset < -150) {
	title_bkg_y_offset += 150
}

if (not audio_is_playing(musTitle)) {
	audio_play_sound(musTitle, 1, true)	
}