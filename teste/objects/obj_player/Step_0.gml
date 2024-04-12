/* Antigo
// Andar


if keyboard_check(vk_left)
{
	x -= spd
}

if keyboard_check(vk_right)
{
	x += spd
}

// colisão
if place_meeting(x,y+1,obj_block)
{
	vspeed = 0
	pulos = 2
}
else
{
	vspeed += 0.3
}

// pulo
if keyboard_check_pressed(vk_space) && pulos > 0
{
	vspeed= -6
	pulos-= 1
}
*/

// Novo

// movimentação horizontal
move = -keyboard_check(vk_left)+keyboard_check(vk_right)

hsp=move*spd
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
if keyboard_check_pressed(vk_space) && pulos > 0
{
	vsp = jspd
	pulos -= 1
}

// Agachar
if keyboard_check(vk_down) {
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


if keyboard_check_pressed(vk_f2) {
	game_restart()
}