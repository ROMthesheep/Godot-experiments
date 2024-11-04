shader_type canvas_item;

uniform vec3 luminance: source_color = vec3(0.3, 0.6, 0.1);
uniform vec3 tint: source_color = vec3(1, 1, 1);
uniform float brightness: hint_range(0.1, 20.0, 0.01) = 2.0;
uniform float contrast: hint_range(1.0, 4.0, 0.01) = 2.0;
uniform float scale: hint_range(1, 3.0, 0.01) = 2.0;
uniform float angle: hint_range(0.0, 6.28, 0.01) = 3.0;
uniform float angle_speed: hint_range(1, 5, 0.1) = 3;

mat2 rotate(float a) {
	float sa = sin(a);
	float ca = cos(a);
	return mat2( vec2(ca, sa), vec2(-sa,ca) );
}
float dot_matrix(vec2 uv) {
	vec2 rot_uv = rotate(angle * TIME * angle_speed/10000.0) * uv * scale;
	return sin(rot_uv.x) * sin(rot_uv.y); 
}

void fragment() {
	vec2 res = 1.0 / TEXTURE_PIXEL_SIZE;
	vec3 color = texture(TEXTURE,UV).rgb;
	float grey = dot(color, luminance) * contrast;
	color = vec3(grey + dot_matrix(UV * res) - 1.2);
	vec4 shader = vec4(color * brightness, 1.0);
	COLOR = shader * vec4(tint,1);
}