extends StaticBody2D

@export var movementSpeed := 400;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += Vector2.DOWN * movementSpeed * delta;

