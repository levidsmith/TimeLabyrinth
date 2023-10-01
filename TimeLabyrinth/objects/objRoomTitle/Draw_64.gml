/// @description Insert description here
// You can write your code in this editor

draw_set_font(fontTitle)
draw_set_halign(fa_center)
draw_set_valign(fa_top)

iXCenter = 1280 / 2
fScale = 1 + (iIntroDelay / 120) * 4
draw_text_transformed(iXCenter, 256, "Time Labyrinth", fScale, fScale, 0)


draw_text_transformed(iXCenter, 600, "MMXXIII LD Smith", 0.2, 0.2, 0)