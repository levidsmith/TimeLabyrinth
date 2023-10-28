/// @description Insert description here
// You can write your code in this editor

iDepartMax = 30
iDelay = 0

STATE_START = 0
STATE_DEPARTING = 1
STATE_RETURNING = 2
iState = STATE_START

vel_x = 0
vel_y = 0
iSpeed = 8

function setup(dir_x, dir_y) {
	vel_x = dir_x * iSpeed
	vel_y = dir_y * iSpeed
	iDelay = iDepartMax
	iState = STATE_DEPARTING
}

function startStateDeparting() {
	
}

function stepStateDeparting() {
	iDelay -= 1
	if (iDelay <= 0) {
		startStateReturning()
	}
	
	x += vel_x
	y += vel_y
	
	checkEnemyCollision()

}

function startStateReturning() {
		iState = STATE_RETURNING	
	
}


function stepStateReturning() {
	checkEnemyCollision()
	checkPlayerCollision()
	moveToPlayer()

}

function checkEnemyCollision() {
	if (place_meeting(x, y, objEnemy)) {
		var e = instance_place(x, y, objEnemy);
		e.setStun(5 * 60)
		iState = STATE_RETURNING
	}
	
}

function checkPlayerCollision() {
	if (place_meeting(x, y + 16, objPlayer)) {
		instance_destroy()	
	}
	
}

function moveToPlayer() {
	if (x > objPlayer.x) {
		x -= iSpeed
		if (x < objPlayer.x) {
			x = objPlayer.x
		}
	} else if (x < objPlayer.x) {
		x += iSpeed	
		if (x > objPlayer.x) {
			x = objPlayer.x
		}
	}

	if (y > objPlayer.y) {
		y -= iSpeed
		if (y < objPlayer.y) {
			y = objPlayer.y
		}
	} else if (y < objPlayer.y) {
		y += iSpeed	
		if (y > objPlayer.y) {
			y = objPlayer.y
		}
	} 
	
}
