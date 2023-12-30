class_name ScoreDisplay
extends Control

var scoreUnrounded := 0.0;
@export var score = 0

@export var snakeNum : int = 3


#func _physics_process(_delta) -> void:
#	score += scoreAdd()

func _process(delta):
	scoreUnrounded += scoreAdd(delta)
	score = ceili(scoreUnrounded)
	print(score)

func scoreAdd(delta):
	if Singletons.snakes != null:
		snakeNum = Singletons.snakes.GetSnakeCount();
	return snakeNum * 5 * delta
	
