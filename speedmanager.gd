extends Node

@export var speed := 100.0;
	
func _process(delta):
	speed += delta * 0.01;
