// movimentação horizontal
move = -keyboard_check(vk_left)+keyboard_check(vk_right) -keyboard_check(ord("A"))+keyboard_check(ord("D"))

hsp=move*spd


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

// Agachar
if keyboard_check(vk_down) or keyboard_check(ord("S")){
	sprite_index = spr_player_cagando
}

else {
	sprite_index = spr_player	
}

// Correr
if keyboard_check(vk_shift) {
	spd = 12
}
else {
	spd = 6
}


if timer <= 0 {
	if place_meeting(x,y,obj_enemy) {
	life -= 10
	timer = 15
	}
}

timer-=1

if life <= 0 {
	instance_destroy()
}