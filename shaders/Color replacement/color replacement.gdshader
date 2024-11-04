shader_type canvas_item;

uniform vec3 replacement_color: source_color;

void fragment() {
	vec3 color_without_green = COLOR.rgb * vec3(1, 0, 1);
	float amount_red_blue = length(color_without_green);
	float red_blue_mask = step(0.01, amount_red_blue);

	//COLOR.rgb = vec3(red_blue_mask);

	vec3 retained_color = COLOR.rgb * red_blue_mask;
	float green_mask = (1.0 - red_blue_mask) * COLOR.g;

	//COLOR.rgb = vec3(green_mask);

	vec3 masked_final_shirt = replacement_color * green_mask;
	vec3 final_color = masked_final_shirt + retained_color;

	COLOR.rgb = final_color;
}