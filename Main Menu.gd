extends Control


# Called when the node enters the scene tree for the first time.
func _on_play_pressed():
	get_tree().change_scene_to_file("res://ScrollingLevel.tscn")

func _on_quit_pressed():
	get_tree().quit

