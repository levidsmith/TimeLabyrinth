/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fontGame)

draw_set_color(color_text)
draw_set_alpha(clamp(iDestroyDelay / objRoomGame.GAMESPEED, 0, 1))

var str = ""

if (iTimeBonus >= 0) {
	str = "+" + string(iTimeBonus) + " sec"
} else {
	str = string(iTimeBonus) + " sec"
}

draw_text_transformed(x, y, str, 0.5, 0.5, 0)
draw_set_alpha(1)
