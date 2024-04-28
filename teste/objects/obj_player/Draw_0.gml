draw_self()

if timer > 0 {
	shader_set(shGreen);
	draw_self();
	shader_reset()
}