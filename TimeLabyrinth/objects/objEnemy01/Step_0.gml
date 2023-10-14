/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

updateKnockback();



switch (iState) {
	case STATE_WAITING:
		iDelay -= 1;
		if (iDelay <= 0) {
			startStateMoving();
		}
	break;
	
	case STATE_MOVING:
		doMoving();
		iDelay -= 1;
		if (iDelay <= 0) {
			startStateWaiting();
			
		}
	break;
}