extends Button

@export var playScene : String;

func restartScene():
	get_tree().change_scene_to_file(playScene)
