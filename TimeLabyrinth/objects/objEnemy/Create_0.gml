/// @description Insert description here
// You can write your code in this editor

iHealth = 1
iAttack = 1
iInvincibleDelay = 0
iBonus = 1

knockback_vel_x = 0
knockback_vel_y = 0


doDamage = function(iDamageValue) {
	iHealth -= iDamageValue	
	iInvincibleDelay = 60
	
	if (iHealth > 0) {
		audio_play_sound(sndEnemyHit, 1, 0)
	} else {
		audio_play_sound(sndEnemyDead, 1, 0)
	}
}

function setKnockback(in_x, in_y) {
	knockback_vel_x = in_x;
	knockback_vel_y = in_y;
	
}

function updateKnockback() {
	if (knockback_vel_x > 0) {
		knockback_vel_x -= 0.1
		if (knockback_vel_x <= 0) {
			knockback_vel_x = 0;	
		}
	} else if (knockback_vel_x < 0) {
		knockback_vel_x += 0.1
		if (knockback_vel_x >= 0) {
			knockback_vel_x = 0;	
		}	
	}

	if (knockback_vel_y > 0) {
		knockback_vel_y -= 0.1
		if (knockback_vel_y <= 0) {
			knockback_vel_y = 0;	
		}
	} else if(knockback_vel_y < 0) {
		knockback_vel_y += 0.1
		if (knockback_vel_y >= 0) {
			knockback_vel_y = 0;	
		}
	}

}
