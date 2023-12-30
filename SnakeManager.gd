class_name SnakeManager
extends Node2D

@export var snakeStartingAmount := 3;
@export var snake : PackedScene; 


# Called when the node enters the scene tree for the first time.
func _ready():
	if Singletons.snakes == null:
		Singletons.snakes = self;

	for i in snakeStartingAmount:
		SpawnSnake();


func SpawnSnake():
	var snakeInstance = snake.instantiate();
	add_child(snakeInstance);

func GetSnakeCount():
	return get_child_count();