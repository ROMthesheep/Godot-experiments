shader_type canvas_item;

void fragment() {
  COLOR = vec4(UV + (sin(TIME)/5.0), 0.8, 1.0);
}
