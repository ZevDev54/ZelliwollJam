extends Node2D

func _process(_delta):
	if Singletons.snakes.GetSnakeCount() <= 0:
		get_tree().change_scene("res://end_screen.tscn")
