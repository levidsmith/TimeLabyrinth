/// @description Insert description here
// You can write your code in this editor


if (iActiveDelay > 0) {
	visible = true
	iActiveDelay = iActiveDelay - 1
	
	if (iActiveDelay == 0) {
		visible = false	
	}
	
}

if (visible and place_meeting(x, y, objEnemy)) {
	var e = instance_place(x, y, objEnemy)
	
	if (e.iInvincibleDelay == 0) {
		e.takeDamage(1)
		e.setKnockback(objPlayer.iFacingX * 6, objPlayer.iFacingY * 6);
//		e.startStateStunned(60);
		

	}
}