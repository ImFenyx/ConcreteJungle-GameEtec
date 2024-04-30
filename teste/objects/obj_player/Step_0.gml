// Movimentação horizontal
move = -keyboard_check(vk_left)+keyboard_check(vk_right) -keyboard_check(ord("A"))+keyboard_check(ord("D"))

hsp=move*spd

// Animações
if move != 0 and !keyboard_check(vk_down) and !keyboard_check(ord("S")) and !place_meeting(x,y-1,obj_block) and place_meeting(x,y+1,obj_block)
{
	sprite_index = spr_player_walk
}
else if keyboard_check(vk_down) or keyboard_check(ord("S")) or place_meeting(x,y-1,obj_block) and place_meeting(x,y+1,obj_block){
	sprite_index = spr_player_crouch
}
else if !place_meeting(x,y+1,obj_block){
	sprite_index = spr_player_fall
}
else {
	sprite_index = spr_player_idle	
}

// Muda o lado de andar
if move!=0 {
	if move < 0 {
		image_xscale = -spritelado
		}
	else {
		image_xscale = +spritelado
	}
}

// colisao x
if place_meeting(x+hsp,y,obj_block)
{
	while !place_meeting(x+sign(hsp),y,obj_block)
	{
		x+=sign(hsp)
	}
	hsp=0
}

x+=hsp

// colisao y
if place_meeting(x,y+vsp,obj_block)
{
	while !place_meeting(x,y+sign(vsp),obj_block)
	{
		y+=sign(vsp)
	}
	vsp=0
}

y+=vsp

// colisao de pulo
if place_meeting(x,y+1,obj_block)
{
	pulos = 2
}
else
{
	vsp += grav
}

// pulo duplo
if keyboard_check_pressed(vk_space) && pulos > 0 or keyboard_check_pressed(vk_up) && pulos > 0
{
	vsp = jspd
	pulos -= 1
}

// Correr
if keyboard_check(vk_shift) and sprite_index = spr_player_walk or sprite_index = spr_player_fall{
	spd = 6
}
else if sprite_index = spr_player_crouch{
	spd = 1
}
else {
	spd = 4
}


if timer <= 0 {
	if place_meeting(x,y,obj_enemy) {
	global.life -= 1
	timer = 50
	audio_play_sound(sfx_hit,0,0)
	}
}

timer-=1

if global.life <= 0 {
	instance_destroy()
}