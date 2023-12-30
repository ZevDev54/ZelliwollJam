class_name AudioRandom;
extends AudioStreamPlayer2D

@export var licksonmydicks : Array[AudioStream];

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func PlayRandomTrack():
	stream = licksonmydicks[randi_range(0, licksonmydicks.size()-1)]
	play()