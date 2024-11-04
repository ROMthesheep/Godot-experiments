shader_type canvas_item;

uniform float colors : hint_range(1.0, 16.0);
uniform float dither : hint_range(0.0, 0.5);
uniform sampler2D screen_content: hint_screen_texture;

void fragment()
{
	float variableDither = sin(TIME) * 0.5;
	float variablecolors = (sin(TIME) * 1.0 + 5.0);

	vec4 color = texture(screen_content, UV);
	float a = floor(mod(UV.x / TEXTURE_PIXEL_SIZE.x, 2.0));
	float b = floor(mod(UV.y / TEXTURE_PIXEL_SIZE.y, 2.0));
	float c = mod(a + b, 2.0);

	COLOR.r = (round(color.r * variablecolors + dither) / variablecolors) * c;
	COLOR.g = (round(color.g * variablecolors + dither) / variablecolors) * c;
	COLOR.b = (round(color.b * variablecolors + dither) / variablecolors) * c;
	c = 1.0 - c;
	COLOR.r += (round(color.r * variablecolors - dither) / variablecolors) * c;
	COLOR.g += (round(color.g * variablecolors - dither) / variablecolors) * c;
	COLOR.b += (round(color.b * variablecolors - dither) / variablecolors) * c;
}