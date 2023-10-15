/// @description Insert description here
// You can write your code in this editor

if (not place_meeting(x + vel_x, y + vel_y, [objWall, objMoat, objBlock])
   ) {
	x = x + vel_x
	y = y + vel_y
}

if (objSword.iActiveDelay == 0) {
	if (keyboard_check(vk_left)) {
		vel_x = -max_speed
		iFacingX = -1
		iFacingY = 0
	} else if (keyboard_check(vk_right)) {
		vel_x = max_speed
		iFacingX = 1
		iFacingY = 0
	} else {
		vel_x = 0	
	}

	if (keyboard_check(vk_up)) {
		vel_y = -max_speed
		iFacingX = 0
		iFacingY = -1
		
	} else if (keyboard_check(vk_down)) {
		vel_y = max_speed
		iFacingX = 0
		iFacingY = 1
	} else {
		vel_y = 0
	}


	if (x < 0) {
		x = 0
	} else if (x + sprite_width > room_width) {
		x = room_width - sprite_width
	}

	if (y < 0) {
		 y = 0
	} else if (y + sprite_height > room_height) {
		y = room_height - sprite_height	
	}
}

if (iFacingY == 1) {
	sprite_index = sprPlayerD	
} else if (iFacingY == -1) {
	sprite_index = sprPlayerU
} else if (iFacingX == -1) {
	sprite_index = sprPlayerL
} else if (iFacingX == 1) {
	sprite_index = sprPlayerR
	
}


if (keyboard_check_pressed(ord("Z")) and objSword.iActiveDelay == 0) {
	objSword.iActiveDelay = objSword.iMaxActiveDelay
	
	objSword.x = x + (sprite_width / 2)
	objSword.y = y + (sprite_height / 2)

	if (iFacingX == 1) {
		objSword.image_angle = 270
		objSword.x += sprite_width
		
	} else if (iFacingX == -1) {
		objSword.image_angle = 90
		objSword.x -= sprite_width 

	} else if (iFacingY == 1) {
		objSword.image_angle = 180
		objSword.y += sprite_height

	} else if (iFacingY == -1) {
		objSword.image_angle = 0
		objSword.y -= sprite_height

	}

	objSword.visible = true
	vel_x = 0
	vel_y = 0
	audio_play_sound(sndSwordSwing, 1, 0)


}


if (keyboard_check_pressed(ord("X")) and instance_number(objBoomerang) == 0) {
	var id_boomerang = instance_create_layer(x, y, "Instances", objBoomerang01)
	id_boomerang.setup(objPlayer.iFacingX, objPlayer.iFacingY)
}


if (iInvincibleDelay > 0) {
	image_alpha = 0.5
	iInvincibleDelay -= 1
	
	if (iInvincibleDelay <= 0) {
		image_alpha = 1	
	}
}

if (global.iTimeRemaining <= 0) {
	instance_destroy()	
}
