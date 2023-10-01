/// @description Insert description here
// You can write your code in this editor
randomize()

STATE_WAIT = 0
STATE_JUMP = 1
iState = STATE_WAIT
iMaxDelay = 2 * 60


iDelay = irandom_range(1, 3) * (60 * 0.5)

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

