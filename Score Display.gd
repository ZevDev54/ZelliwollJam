extends Control


@export var score = 0

func _physics_process():
	score += scoreAdd

func scoreAdd(delta):
	return snakeNum * 5 * delta
	print(score)