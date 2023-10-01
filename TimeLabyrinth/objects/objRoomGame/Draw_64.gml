/// @description Insert description here
// You can write your code in this editor
draw_set_font(fontGame)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)

strLevelNames = ["Nisan", "Iyar", "Sivan", "Tammuz", "Av", "Elul", "Tishrei", "Cheshvan", "Kislev", "Tevet", "Shevat", "Adar"]
draw_text_transformed(32, 16, string(floor(global.iLevel / 12) + 1) + " - " + strLevelNames[global.iLevel % 12], 0.5, 0.5, 0)	

draw_text_transformed(800, 16, "Time: " + string_format(clamp(global.iTimeRemaining / GAMESPEED, 0, infinity), 1, 1), 0.5, 0.5, 0)	
if (instance_number(objPlayer) > 0) {
	draw_text_transformed(800, 32, "Maximum Time: " + string(objPlayer.iMaximumTime), 0.5, 0.5, 0)	
}
//draw_text(512, 32, "Game Speed: " + string(game_get_speed(gamespeed_fps)))


if (isLevelCompleted) {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	iXText = 1280 / 2
	iYText = 960 / 2
//	draw_text(iXText, iYText, "Level Completed" + string(iLevelCompleteDelay / game_get_speed(gamespeed_fps)))	
	draw_text(iXText, iYText, "Level Complete")	
}


if (isGameOver) {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	iXText = 1280 / 2
	iYText = 960 / 2

	draw_text(iXText, iYText, "Game Over")	
}