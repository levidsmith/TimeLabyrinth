/// @description Insert description here
// You can write your code in this editor


vel_x = 0
vel_y = 0
max_speed = 4

iDefense = 4

iInvincibleDelay = 0

iFacingY = -1
iFacingX = 0

iMaximumTime = 60
isAlive = true


function checkDoorCollision() {
	//move to the next room
	if (place_meeting(x, y, objDoor)) {
		id_door = instance_place(x, y, objDoor)
		if (id_door.isOpen) {
			objDungeon.moveRoomRight()
			audio_play_sound(sndLevelComplete, 1, false)
		}
	}	
}


function checkCanMove() {
	canMove = true
	if (place_meeting(x + vel_x, y + vel_y, [objWall, objMoat, objBlock]) ) {
		canMove = false	
	}
	
	for (var i = 0; i < instance_number(objDoor); i++) {
		var inst = instance_find(objDoor, i);
		
		if (place_meeting(x + vel_x, y + vel_y, inst) and not inst.isOpen) {
			canMove = false
		}
	}
	
	
	return canMove

	
}