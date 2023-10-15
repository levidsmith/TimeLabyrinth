/// @description Insert description here
// You can write your code in this editor


switch(iState) {

	case STATE_DEPARTING:
		doDeparting()
		iDelay -= 1
		if (iDelay <= 0) {
			iState = STATE_RETURNING	
		}
	break;
	case STATE_RETURNING:
		doReturning()
	break;
}