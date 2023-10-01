/// @description Insert description here
// You can write your code in this editor

iHealth = 1
iAttack = 1
iInvincibleDelay = 0
iBonus = 1

doDamage = function(iDamageValue) {
	iHealth -= iDamageValue	
	iInvincibleDelay = 60
	
	if (iHealth > 0) {
		audio_play_sound(sndEnemyHit, 1, 0)
	} else {
		audio_play_sound(sndEnemyDead, 1, 0)
	}
}
