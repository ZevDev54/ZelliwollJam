extends Node2D


func Input.on_key_just_pressed("Pause"):
	get_tree().change_scene_to_file("res://Pause.tscn")