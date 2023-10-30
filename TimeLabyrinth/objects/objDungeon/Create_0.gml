/// @description Insert description here
// You can write your code in this editor
global.TILE_SIZE = 64

rooms = []

audio_stop_sound(musTitle)



/*
id_room = instance_create_layer(0, 0, "InstancesRooms", objRoom)
id_room.createRoom(1)
array_push(rooms, id_room)

id_room = instance_create_layer(0, 0, "InstancesRooms", objRoom)
id_room.createRoom(2)
array_push(rooms, id_room)

id_room = instance_create_layer(0, 0, "InstancesRooms", objRoom)
id_room.createRoom(3)
array_push(rooms, id_room)
*/




function moveRoomRight() {
	layer_destroy_instances("InstancesWalls")
	layer_destroy_instances("InstancesEnemies")
	
	objPlayer.x = 10 * global.TILE_SIZE
	objPlayer.y = 7 * global.TILE_SIZE
	
	if (global.iLevel % 12 == 0) {
		global.level_format_ids = array_shuffle(global.level_format_ids)
	}
	iRoom = global.level_format_ids[global.iLevel % 12]
	
	var id_room

	id_room = instance_create_layer(0, 0, "InstancesRooms", objRoom)
	id_room.createRoom(iRoom)
	array_push(rooms, id_room)

	global.iLevel += 1

}

function moveRoomLeft() {
	
}

function moveRoomTop() {
	
}

function moveRoomBottom() {
	
}


moveRoomRight()