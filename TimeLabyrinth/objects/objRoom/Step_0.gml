/// @description Insert description herea
// You can write your code in this editor


if ((not isRoomCompleted) and instance_number(objEnemy) == 0) {
	isRoomCompleted = true
	openDoors()
//	global.iLevel += 1
//	iLevelCompleteDelay = game_get_speed(gamespeed_fps) * 3
//	audio_play_sound(sndLevelComplete, 1, 0)
}


/*
if (isLevelCompleted) {
	iLevelCompleteDelay -= 1
	
	if (iLevelCompleteDelay == 0) {
		room_restart()	
	}
}
*/

if (not isGameOver) {
	
	//if (instance_number(objPlayer) == 0) {
	//	isGameOver = true	
	//}
	if (not objPlayer.isAlive) {
		isGameOver = true
	}
} else {
	if (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(ord("C")))	{
		room_goto(RoomTitle)	
	}
}

if (not isRoomCompleted and not isGameOver) {
	global.iTimeRemaining -= 1
	
}


if (keyboard_check_pressed(vk_escape)) {
	room_goto(RoomTitle)
}

if (not audio_is_playing(musGame)) {
	audio_play_sound(musGame, 1, true)	
}