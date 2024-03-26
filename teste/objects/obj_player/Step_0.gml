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

move = -keyboard_check(vk_left)+keyboard_check(vk_right)

hsp=move*spd
//x
if place_meeting(x+hsp,y,obj_block)
{
	while !place_meeting(x+sign(hsp),y,obj_block)
	{
		x+=sign(hsp)
	}
	hsp=0
}

x+=hsp

//y
if place_meeting(x,y+vsp,obj_block)
{
	while !place_meeting(x,y+sign(vsp),obj_block)
	{
		y+=sign(vsp)
	}
	vsp=0
}

y+=vsp

//pulo
if place_meeting(x,y+1,obj_block)
{
	pulos = 2
}
else
{
	vsp += grav
}

if keyboard_check_pressed(vk_space) && pulos > 0
{
	vsp = jspd
	pulos -= 1
}

if life <= 0
{
	instance_destroy(obj_player)
	show_message("você morreu")
}