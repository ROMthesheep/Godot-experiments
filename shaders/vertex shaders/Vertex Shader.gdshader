shader_type canvas_item;

void vertex() {
	if (VERTEX.y < 0.0) {
		VERTEX += vec2(sin(TIME) * 25.0, 0);
	}
}
