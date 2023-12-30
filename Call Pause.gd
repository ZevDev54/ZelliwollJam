extends Node2D

@onready var pause_menu = $Pause

var paused = false

func _ready():
	pause_menu.hide()

func _process(_delta):	
	if Input.is_action_just_pressed("Pause"):
		pauseMenu()

func pauseMenu():
	print("test")
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0

	paused = !paused
