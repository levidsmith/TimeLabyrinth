/// @description Insert description here
// You can write your code in this editor

switch(iState) {
	case STATE_WAIT:
		iDelay -= 1
	
		if (iDelay <= 0) {
			iState	= STATE_JUMP
			vel_y = iJumpSpeed
			target_y = y
		}
	break;
	case STATE_JUMP:
		vel_y -= 1
		
		if (x + vel_x < objRoomGame.TILE_SIZE * 1) {
			vel_x = iSpeed	
		} else if (x + sprite_width + vel_x > objRoomGame.TILE_SIZE * (objRoomGame.X_TILES - 2)) {
			vel_x = -iSpeed
			
		}

		x += vel_x
		y -= vel_y
		
		if (y > target_y) {
			iState = STATE_WAIT
			y = target_y
			iDelay = irandom_range(0, 2) * (60 * 0.5)
		}
	break;
	

}


// Inherit the parent event
event_inherited();

