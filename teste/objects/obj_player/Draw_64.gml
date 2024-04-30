// GUI de vida
var _sprl = sprite_get_width(spr_vida) * 2;
var _buffer = 40;
var _vidas = global.life

for (var i = 0; i < _vidas; i++;) {
	draw_sprite_ext(spr_vida, 0, 40 + (_sprl * i) + (_buffer * i), 120, 4, 4, 0, c_white, 1);
}