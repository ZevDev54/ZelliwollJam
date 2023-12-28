shader_type canvas_item;


uniform vec2 motion;


void fragment () {
	COLOR = texture(TEXTURE, 
	vec2(UV.x + 
	TIME * motion.x, 
	UV.y + TIME * motion.y));
}