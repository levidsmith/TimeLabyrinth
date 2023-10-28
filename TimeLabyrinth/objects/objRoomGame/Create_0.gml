/// @description Insert description here
// You can write your code in this editor

//global.iLevel = 0

TILE_SIZE = 64
X_TILES = 20
Y_TILES = 15

GAMESPEED = game_get_speed(gamespeed_fps)
randomize()

isLevelCompleted = false
isGameOver = false

objPlayer.x = 10 * TILE_SIZE
objPlayer.y = 7 * TILE_SIZE






//read room layouts
//iRoom = irandom(11)
if (global.iLevel % 12 == 0) {
	global.level_format_ids = array_shuffle(global.level_format_ids)
}
iRoom = global.level_format_ids[global.iLevel % 12]
switch(iRoom) {
	case 0:
		strRoomFile = "room01.txt"
		break;

	case 1:
		strRoomFile = "room02.txt"
		break;
	case 2:
		strRoomFile = "room03.txt"
		break;
	case 3:
		strRoomFile = "room04.txt"
		break;
	case 4:
		strRoomFile = "room05.txt"
		break;
	case 5:
		strRoomFile = "room06.txt"
		break;
	case 6:
		strRoomFile = "room07.txt"
		break;
	case 7:
		strRoomFile = "room08.txt"
		break;
	case 8:
		strRoomFile = "room09.txt"
		break;
	case 9:
		strRoomFile = "room10.txt"
		break;
	case 10:
		strRoomFile = "room11.txt"
		break;
	case 11:
		strRoomFile = "room12.txt"
		break;

	default:
		strRoomFile = "room01.txt"
		break;
}



//level_colors = [c_red, c_orange, c_yellow, c_green, c_blue, c_aqua, c_purple, c_gray]
level_colors = [make_color_hsv(0, 128, 128),
				make_color_hsv(30, 128, 128),
				make_color_hsv(60, 128, 128),
				make_color_hsv(120, 128, 128),
				make_color_hsv(180, 128, 128),
				make_color_hsv(270, 128, 128),
				make_color_hsv(300, 128, 128),
				make_color_hsv(330, 128, 128),
               ]
level_color = level_colors[global.color_ids[global.iLevel % 7]]
file = file_text_open_read(strRoomFile);
strData = ""
iRow = 2
while (not file_text_eof(file)) {
	strData = file_text_readln(file)
	iCol = 1
	while (iCol < string_length(strData) + 1) {
		if (string_char_at(strData, iCol) == "#") {
			if (iCol == 1 or iRow == 2 or iCol == X_TILES or iRow == Y_TILES - 1) {
				var id_wall = instance_create_layer((iCol - 1) * objRoomGame.TILE_SIZE, iRow * objRoomGame.TILE_SIZE, "InstancesWalls", objWall)	
				id_wall.image_blend = level_color
			} else {
				var id_block = instance_create_layer((iCol - 1) * objRoomGame.TILE_SIZE, iRow * objRoomGame.TILE_SIZE, "InstancesWalls", objBlock)	
				id_block.image_blend = level_color
				
			}
		} else if (string_char_at(strData, iCol) == "~") {
			instance_create_layer((iCol - 1) * objRoomGame.TILE_SIZE, iRow * objRoomGame.TILE_SIZE, "InstancesWalls", objMoat)	
		} else  {
			var id_floor = instance_create_layer((iCol - 1) * objRoomGame.TILE_SIZE, iRow * objRoomGame.TILE_SIZE, "InstancesWalls", objFloor)	
			id_floor.image_blend = level_color
		}
		iCol += 1
	}
	iRow += 1
}


//create enemies
switch (global.iLevel % 3) {

	case 2:
		iEnemyCount = 2
		for (i = 0; i < iEnemyCount; i++) {
			iEnemyX = (irandom_range(1, X_TILES - 2)) * TILE_SIZE
			iEnemyY = (irandom_range(3, Y_TILES - 2)) * TILE_SIZE
	
			var id_enemy = instance_create_layer(iEnemyX, iEnemyY, "Instances", objEnemy03G)
			with id_enemy {
				while (place_meeting(x, y, [objWall, objMoat, objBlock, objEnemy])) {
					x = (irandom_range(1, objRoomGame.X_TILES - 2)) * objRoomGame.TILE_SIZE
					y = (irandom_range(3, objRoomGame.Y_TILES - 2)) * objRoomGame.TILE_SIZE
			
				}
			}
		}
		
		iEnemyCount = 2
		for (i = 0; i < iEnemyCount; i++) {
			iEnemyX = (irandom_range(1, X_TILES - 2)) * TILE_SIZE
			iEnemyY = (irandom_range(3, Y_TILES - 2)) * TILE_SIZE
	
			var id_enemy = instance_create_layer(iEnemyX, iEnemyY, "Instances", objEnemy03B)
			with id_enemy {
				while (place_meeting(x, y, [objWall, objMoat, objBlock, objEnemy])) {
					x = (irandom_range(1, objRoomGame.X_TILES - 2)) * objRoomGame.TILE_SIZE
					y = (irandom_range(3, objRoomGame.Y_TILES - 2)) * objRoomGame.TILE_SIZE
			
				}
			}
		}

		iEnemyCount = 1
		for (i = 0; i < iEnemyCount; i++) {
			iEnemyX = (irandom_range(1, X_TILES - 2)) * TILE_SIZE
			iEnemyY = (irandom_range(3, Y_TILES - 2)) * TILE_SIZE
	
			var id_enemy = instance_create_layer(iEnemyX, iEnemyY, "Instances", objEnemy03R)
			with id_enemy {
				while (place_meeting(x, y, [objWall, objMoat, objBlock, objEnemy])) {
					x = (irandom_range(1, objRoomGame.X_TILES - 2)) * objRoomGame.TILE_SIZE
					y = (irandom_range(3, objRoomGame.Y_TILES - 2)) * objRoomGame.TILE_SIZE
			
				}
			}
		}


		break;


	case 1:
		iEnemyCount = 6
		for (i = 0; i < iEnemyCount; i++) {
			iEnemyX = (irandom_range(1, X_TILES - 2)) * TILE_SIZE
			iEnemyY = (irandom_range(3, Y_TILES - 2)) * TILE_SIZE
	
			var id_enemy = instance_create_layer(iEnemyX, iEnemyY, "Instances", objEnemy02G)
			with id_enemy {
				while (place_meeting(x, y, [objWall, objMoat, objBlock, objEnemy])) {
					x = (irandom_range(1, objRoomGame.X_TILES - 2)) * objRoomGame.TILE_SIZE
					y = (irandom_range(3, objRoomGame.Y_TILES - 2)) * objRoomGame.TILE_SIZE
			
				}
			}
		}

		iEnemyCount = 3
		for (i = 0; i < iEnemyCount; i++) {
			iEnemyX = (irandom_range(1, X_TILES - 2)) * TILE_SIZE
			iEnemyY = (irandom_range(3, Y_TILES - 2)) * TILE_SIZE
	
			var id_enemy = instance_create_layer(iEnemyX, iEnemyY, "Instances", objEnemy02B)
			with id_enemy {
				while (place_meeting(x, y, [objWall, objMoat, objBlock, objEnemy])) {
					x = (irandom_range(1, objRoomGame.X_TILES - 2)) * objRoomGame.TILE_SIZE
					y = (irandom_range(3, objRoomGame.Y_TILES - 2)) * objRoomGame.TILE_SIZE
			
				}
			}
		}

		iEnemyCount = 1
		for (i = 0; i < iEnemyCount; i++) {
			iEnemyX = (irandom_range(1, X_TILES - 2)) * TILE_SIZE
			iEnemyY = (irandom_range(3, Y_TILES - 2)) * TILE_SIZE
	
			var id_enemy = instance_create_layer(iEnemyX, iEnemyY, "Instances", objEnemy02R)
			with id_enemy {
				while (place_meeting(x, y, [objWall, objMoat, objBlock, objEnemy])) {
					x = (irandom_range(1, objRoomGame.X_TILES - 2)) * objRoomGame.TILE_SIZE
					y = (irandom_range(3, objRoomGame.Y_TILES - 2)) * objRoomGame.TILE_SIZE
			
				}
			}
		}


	break;
	
	case 0:
iEnemyCount = 6
for (i = 0; i < iEnemyCount; i++) {
	iEnemyX = (irandom_range(1, X_TILES - 2)) * TILE_SIZE
	iEnemyY = (irandom_range(3, Y_TILES - 2)) * TILE_SIZE
	
	var id_enemy = instance_create_layer(iEnemyX, iEnemyY, "Instances", objEnemy01G)
	with id_enemy {
		while (place_meeting(x, y, [objWall, objMoat, objBlock, objEnemy])) {
			x = (irandom_range(1, objRoomGame.X_TILES - 2)) * objRoomGame.TILE_SIZE
			y = (irandom_range(3, objRoomGame.Y_TILES - 2)) * objRoomGame.TILE_SIZE
			
		}
	}
}

iEnemyCount = 3
for (i = 0; i < iEnemyCount; i++) {
	iEnemyX = (irandom_range(1, X_TILES - 2)) * TILE_SIZE
	iEnemyY = (irandom_range(3, Y_TILES - 2)) * TILE_SIZE
	var id_enemy = instance_create_layer(iEnemyX, iEnemyY, "Instances", objEnemy01B)
	with id_enemy {
		while (place_meeting(x, y, [objWall, objMoat, objBlock, objEnemy])) {
			x = (irandom_range(1, objRoomGame.X_TILES - 2)) * objRoomGame.TILE_SIZE
			y = (irandom_range(3, objRoomGame.Y_TILES - 2)) * objRoomGame.TILE_SIZE
			
		}
	}
}


iEnemyCount = 1
for (i = 0; i < iEnemyCount; i++) {
	iEnemyX = (irandom_range(1, X_TILES - 2)) * TILE_SIZE
	iEnemyY = (irandom_range(3, Y_TILES - 2)) * TILE_SIZE
	var id_enemy = instance_create_layer(iEnemyX, iEnemyY, "Instances", objEnemy01R)
	with id_enemy {
		while (place_meeting(x, y, [objWall, objMoat, objBlock, objEnemy])) {
			x = (irandom_range(1, objRoomGame.X_TILES - 2)) * objRoomGame.TILE_SIZE
			y = (irandom_range(3, objRoomGame.Y_TILES - 2)) * objRoomGame.TILE_SIZE
			
		}
	}
}
	break;

}

audio_stop_sound(musTitle)
if (not audio_is_playing(musGame)) {
	audio_play_sound(musGame, 1, true)
}