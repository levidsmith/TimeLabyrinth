/// @description Insert description here
// You can write your code in this editor


if ((not isLevelCompleted) and instance_number(objEnemy) == 0) {
	isLevelCompleted = true
	global.iLevel += 1
	iLevelCompleteDelay = game_get_speed(gamespeed_fps) * 3
	audio_play_sound(sndLevelComplete, 1, 0)
}


if (isLevelCompleted) {
	iLevelCompleteDelay -= 1
	
	if (iLevelCompleteDelay == 0) {
		room_restart()	
	}
}

if (not isGameOver) {
	
	if (instance_number(objPlayer) == 0) {
		isGameOver = true	
	}
} else {
	if (keyboard_check_pressed(vk_space) )	{
		room_goto(RoomTitle)	
	}
}

if (not isLevelCompleted and not isGameOver) {
	global.iTimeRemaining -= 1
	
}


if (keyboard_check_pressed(vk_escape)) {
	room_goto(RoomTitle)
}