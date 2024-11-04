shader_type canvas_item;

void fragment() {
	COLOR.r = 1.0; // esto da igual xq luego volvemos a pisarlo
	COLOR = texture(TEXTURE, UV + vec2(sin(TIME)/10.0,cos(TIME)/10.0)); // leemos la textura del sprite2d
	COLOR.b = 1.0;
}
