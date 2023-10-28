/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

updateKnockback();



switch (iState) {
	case State.WAITING:
		stepStateWaiting()
	break;
	
	case State.MOVING:
		stepStateMoving()
	break;
	
	case State.STUNNED:
		stepStateStunned()
	break;
}