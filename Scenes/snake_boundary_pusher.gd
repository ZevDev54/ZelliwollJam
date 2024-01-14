extends Area2D

@export var pushVector : Vector2

func _physics_process(delta):
	for body : RigidBody2D in get_overlapping_bodies():
		var snake = body as TopDownSnakeMovement;
		snake.boundaryPush(pushVector);
		
