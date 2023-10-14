/// @description Insert description here
// You can write your code in this editor

event_inherited()

iSpeed = 1
iBonus = 1

vel_x = 0
vel_y = 0

knockback_vel_x = 0
knockback_vel_y = 0

iDelay = 0

fMinMoveTime = 2
fMaxMoveTime = 5
fMinWaitTime = 0.5
fMaxWaitTime = 1


STATE_WAITING = 0
STATE_MOVING = 1
iState = STATE_MOVING


function startStateMoving() {
	iState = STATE_MOVING;
	changeDirection();
	iDelay = random_range(fMinMoveTime, fMaxMoveTime) * objRoomGame.GAMESPEED

}

function startStateWaiting() {
	iState = STATE_WAITING;
	iDelay = random_range(fMinWaitTime, fMaxWaitTime) * objRoomGame.GAMESPEED
	stopMoving();	
}

function changeDirection() {
	iRandArray = [0, 1, 2, 3];
	iRandArray = array_shuffle(iRandArray);
	
	i = 0;
	while (i < 4) {	
		changeDirectionVelocity(iRandArray[i]);
		if (not willCollideWithWall()) {
			break;	
		}
		i += 1
	}
}

function changeDirectionVelocity(iDirection) {
		switch(iDirection) {
			case 0:
				vel_x = 0
				vel_y = -iSpeed
			break;

			case 1:
				vel_x = iSpeed
				vel_y = 0
			break;

			case 2:
				vel_x = 0
				vel_y = iSpeed
			break;

			case 3:
				vel_x = -iSpeed
				vel_y = 0
			break;
		}
	
}


function stopMoving() {
	vel_x = 0
	vel_y = 0
}

function willCollideWithWall() {
	if (place_meeting(x + vel_x + knockback_vel_x, 
					  y + vel_y + knockback_vel_y, 
					 [objWall, objMoat, objBlock])) {
		return true;
	} else {
		return false;	
	}
}


function doMoving() {
	if (willCollideWithWall()) {
		knockback_vel_x = 0
		knockback_vel_y = 0
		changeDirection();
	}

	x = x + vel_x + knockback_vel_x
	y = y + vel_y + knockback_vel_y	
}



changeDirection();