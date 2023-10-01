/// @description Insert description here
// You can write your code in this editor


if (place_meeting(x + vel_x, y + vel_y, [objWall, objMoat, objBlock])) {
	vel_x = -vel_x
	vel_y = -vel_y
}


x = x + vel_x
y = y + vel_y



if (iActionDelay > 0) {
	iActionDelay -= 1
	
	if (iActionDelay <= 0) {
		iWaitDelay = irandom_range(0, 1) * objRoomGame.GAMESPEED
	}
	
}

if (iWaitDelay > 0) {
	iWaitDelay -= 1	
	
	if (iWaitDelay <= 0) {
		iRandMove = irandom(3)
		switch(iRandMove) {
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
		iActionDelay = irandom_range(2, 5) * 30
	}
}


// Inherit the parent event
event_inherited();


iLifetime += 1
for (i = 0; i < array_length(children_enemies); i++) {
	if (instance_exists(children_enemies[i])) {
		iRotOrig = 2 * pi * i / iEnemyCount
		iRotCurrent = iLifetime / 60
		
		children_enemies[i].x = x + (sprite_width / 2) + iRadius * (cos(iRotOrig + iRotCurrent))
		children_enemies[i].y = y + (sprite_height / 2) + iRadius * (sin(iRotOrig + iRotCurrent))
	}
	
			
}
