draw_self()
// mostrar vida
draw_text(x,y-128,life)

if timer > 0 {
	shader_set(shWhite);
	draw_self();
	shader_reset()
}