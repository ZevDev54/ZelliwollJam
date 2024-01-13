class_name Hazard;

extends StaticBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += Vector2.DOWN * Speedmanager.speed * delta;
