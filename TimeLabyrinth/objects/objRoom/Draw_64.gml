/// @description Insert description here
// You can write your code in this editor
draw_set_font(fontGame)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)

strLevelNames = ["Nisan", "Iyar", "Sivan", "Tammuz", "Av", "Elul", "Tishrei", "Cheshvan", "Kislev", "Tevet", "Shevat", "Adar"]
draw_text_transformed(32, 16, string(floor(global.iLevel / 12) + 1) + " - " + strLevelNames[global.iLevel % 12], 0.5, 0.5, 0)	

//draw_text_transformed(800, 16, "Time: " + string_format(clamp(global.iTimeRemaining / GAMESPEED, 0, infinity), 1, 1), 0.5, 0.5, 0)	
//if (instance_number(objPlayer) > 0) {
	//draw_text_transformed(800, 32, "Maximum Time: " + string(objPlayer.iMaximumTime), 0.5, 0.5, 0)	
//}
//draw_text(512, 32, "Game Speed: " + string(game_get_speed(gamespeed_fps)))

//Current sword

draw_sprite(sprSword, 1, (1280 / 2) - 64, 64)
draw_text_transformed((1280 / 2) - 64, 96, "Z", 0.5, 0.5, 0)	

//Current item
draw_sprite(sprBoomerang01, 1, (1280 / 2), 64)
draw_text_transformed((1280 / 2), 96, "X", 0.5, 0.5, 0)	


/*
if (isRoomCompleted) {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	iXText = 1280 / 2
	iYText = 960 / 2
//	draw_text(iXText, iYText, "Level Completed" + string(iLevelCompleteDelay / game_get_speed(gamespeed_fps)))	
	draw_text(iXText, iYText, "Room Complete")	
}
*/


if (isGameOver) {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	iXText = 1280 / 2
	iYText = 960 / 2

	draw_text(iXText, iYText, "Game Over")	
}

function drawContainers() {
	draw_set_alpha(1)
	iContainers = floor(objPlayer.iMaximumTime / 20)
	for (i = 0; i < iContainers; i++) {
		rect_x = 800 + (28 * i)
		rect_y = 64
		rect_w = 20
		rect_h = 40
	
	
		iContainerFullVal = (i + 1) * 20 * 60
		iPartialContainerPercent = (global.iTimeRemaining - (i * 20 * 60)) / (20 * 60)

		if (global.iTimeRemaining >=  iContainerFullVal) {
			draw_set_color(c_red)
			draw_rectangle(rect_x, rect_y, rect_x + rect_w, rect_y + rect_h, false)
		} else if (iPartialContainerPercent > 0) {
			draw_set_color(c_red)
			draw_rectangle(rect_x, rect_y + rect_h * (1 -  iPartialContainerPercent), rect_x + rect_w, rect_y + rect_h, false)
		
		}
	

		draw_set_color(c_white)
		draw_rectangle(rect_x, rect_y, rect_x + rect_w, rect_y + rect_h, true)

	}
	

}



if (instance_number(objPlayer) > 0) {
	drawContainers()	
}

