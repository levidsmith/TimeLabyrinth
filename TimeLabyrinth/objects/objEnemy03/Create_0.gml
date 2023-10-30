/// @description Insert description here
// You can write your code in this editor
//iHealth = 5
//iInvincibleDelay = 0
event_inherited()

iSpeed = 1
iBonus = 1

vel_x = 0
vel_y = 0

iMaxActionDelay = 60
iActionDelay = 0
iWaitDelay = 1

iLifetime = 0


children_enemies = []


function createChildrenEnemies(iCount, objType) {
	iRadius = 1 * global.TILE_SIZE
	iEnemyCount = iCount
	for (i = 0; i < iEnemyCount; i++) {
		iEnemyX = x + iRadius * (cos(2 * pi * i / iEnemyCount ))
		iEnemyY = y + iRadius * (sin(2 * pi * i / iEnemyCount ))
	
		var id_enemy = instance_create_layer(iEnemyX, iEnemyY, "Instances", objType)
			
		array_push(children_enemies, id_enemy)
			
	}
}




function takeDamage(iDamageValue) {
	isAttackable = true
	for (i = 0; i < array_length(children_enemies); i++) {
		if (instance_exists(children_enemies[i])) {
			isAttackable = false
		}
	}

	if (isAttackable) {
		iHealth -= iDamageValue
		iInvincibleDelay = 60
		
		if (iHealth > 0) {
			audio_play_sound(sndEnemyHit, 1, 0)
		} else {
			audio_play_sound(sndEnemyDead, 1, 0)
		}

	}
}
