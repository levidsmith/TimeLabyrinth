/// @description Insert description here
// You can write your code in this editor


if (iHealth <= 0) {
	global.iTimeRemaining += iBonus * objRoomGame.GAMESPEED
		if (global.iTimeRemaining > objPlayer.iMaximumTime * objRoomGame.GAMESPEED) {
			global.iTimeRemaining = objPlayer.iMaximumTime * objRoomGame.GAMESPEED
		}
		
		var time_bonus = instance_create_layer(x, y, "Instances", objTimeBonus)
		time_bonus.iTimeBonus = iBonus
		time_bonus.color_text = make_color_rgb(128, 255, 128)

	
	instance_destroy()	
}


if (iInvincibleDelay > 0) {
	image_alpha = 0.2
	iInvincibleDelay -= 1
	
} else {
	image_alpha = 1
	
}


if (place_meeting(x, y, objPlayer) and (objPlayer.iInvincibleDelay <= 0)) {
//	objPlayer.iHealth -= objPlayer.iDefense * iAttack
    global.iTimeRemaining -= iAttack * objRoomGame.GAMESPEED
	var time_bonus = instance_create_layer(x, y, "Instances", objTimeBonus)
	time_bonus.iTimeBonus = -iAttack
	time_bonus.color_text = c_red
	
	objPlayer.iInvincibleDelay = objRoomGame.GAMESPEED * 1.5
	audio_play_sound(sndPlayerHit, 1, 0)

	
}