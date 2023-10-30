/// @description Insert description here
// You can write your code in this editor

randomize()



//iDelay = irandom_range(1, 3) * (60 * 0.5)

iSpeed = 4
iJumpSpeed = 8

iRand = irandom(1)
if (iRand == 0) {
	vel_x = iSpeed
} else {
	vel_x = -iSpeed
}	

vel_y = 0
target_y = 0



// Inherit the parent event
event_inherited();


function startStateJumping() {
	iState = State.JUMPING
	vel_y = iJumpSpeed
	target_y = y
	
}

function stepStateJumping() {
	vel_y -= 1
		
	if (x + vel_x < global.TILE_SIZE * 1) {
		vel_x = iSpeed	
	} else if (x + sprite_width + vel_x > global.TILE_SIZE * (objRoom.X_TILES - 2)) {
		vel_x = -iSpeed
			
	}

	x += vel_x
	y -= vel_y
		
	if (y > target_y) {
		startStateWaiting()
	}

	
}

function startStateWaiting() {
	iState = State.WAITING
	y = target_y
	iDelay = irandom_range(0, 4) * (60 * 0.5)
	
}

function stepStateWaiting() {
	iDelay -= 1
	
	if (iDelay <= 0) {
		startStateJumping()
	}

	
}

function startStateStunned(in_stun) {
	iState = State.STUNNED
	iStunDelay = 5 * 60
	
	
}

function stepStateStunned() {
	iStunDelay -= 1
	if (iStunDelay <= 0) {
		startStateJumping()	
	}
	

	
}

startStateJumping()