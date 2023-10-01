/// @description Insert description here
// You can write your code in this editor


if (iDestroyDelay > 0) {
	iDestroyDelay -= 1
	if (iDestroyDelay <= 0) {
		instance_destroy()	
	}
}