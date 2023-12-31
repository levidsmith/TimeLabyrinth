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

//enum State { WAITING, MOVING, STUNNED }
iState = State.MOVING


function startStateMoving() {
	iState = State.MOVING;
	changeDirection();
	iDelay = random_range(fMinMoveTime, fMaxMoveTime) * objRoom.GAMESPEED

}

function stepStateMoving() {
	
	iDelay -= 1;
	if (iDelay <= 0) {
		startStateWaiting()
	}

	
	if (willCollideWithWall()) {
		knockback_vel_x = 0
		knockback_vel_y = 0
		changeDirection();
	}

	if (iStunDelay > 0) {
		//dont move
	} else {
		x = x + vel_x + knockback_vel_x
		y = y + vel_y + knockback_vel_y	
	}
}


function startStateWaiting() {
	iState = State.WAITING;
	iDelay = random_range(fMinWaitTime, fMaxWaitTime) * objRoom.GAMESPEED
	stopMoving();	
}

function stepStateWaiting() {
	iDelay -= 1;
	if (iDelay <= 0) {
		startStateMoving()
	}
	
}

function startStateStunned(in_stun) {
	vel_x = 0
	vel_y = 0
}

function stepStateStunned() {
		iStunDelay -= 1
		if (iStunDelay <= 0) {
			startStateMoving()	
		}
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
					 [objWall, objMoat, objBlock, objDoor])) {
		return true;
	} else {
		return false;	
	}
}





changeDirection();