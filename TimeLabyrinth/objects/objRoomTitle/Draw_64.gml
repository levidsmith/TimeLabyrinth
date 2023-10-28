/// @description Insert description here
// You can write your code in this editor


var i = 0
var j = 0

for (i = 0; i < 8; i++) {
	for (j = 0; j < 5; j++) {
		draw_sprite_ext(sprTitleBkg, 0, j * 300, i * 150 + title_bkg_y_offset, 1, 1, 0, c_white, 0.2)
	}
}


draw_sprite_ext(sprTitleBkgGradient, 0, 0, 0, 1, 1, 0, c_white, 1)

draw_set_font(fontTitle)
draw_set_halign(fa_center)
draw_set_valign(fa_top)

iXCenter = 1280 / 2
fScale = 1 + (iIntroDelay / 120) * 4

str = "Time Labyrinth"
draw_set_color(c_black)
draw_text_transformed(iXCenter - 4, 256 - 4, str, fScale, fScale, 0)

draw_set_color(c_white)
draw_text_transformed(iXCenter, 256, str, fScale, fScale, 0)

str = "Press Z or X"
draw_set_color(c_black)
draw_text_transformed(iXCenter - 2, 800 - 2, str, 0.2, 0.2, 0)

draw_set_color(c_white)
draw_text_transformed(iXCenter, 800, str, 0.2, 0.2, 0)

draw_set_alpha(.5)
draw_text_transformed(iXCenter, 900, "MMXXIII LD Smith", 0.15, 0.15, 0)

draw_set_alpha(1)