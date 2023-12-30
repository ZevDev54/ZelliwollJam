class_name SnakeManager
extends Node2D

@export var snakeStartingAmount := 3;
@export var snake : PackedScene; 

@export var spawnPos : Node2D;


# Called when the node enters the scene tree for the first time.
func _ready():
	if Singletons.snakes == null:
		Singletons.snakes = self;

	for i in snakeStartingAmount:
		SpawnSnake(spawnPos.global_position);


func SpawnSnake(position):
	var snakeInstance = snake.instantiate();
	add_child(snakeInstance); 

	snakeInstance.global_position = position;
	
func GetSnakeCount():
	return get_child_count();
