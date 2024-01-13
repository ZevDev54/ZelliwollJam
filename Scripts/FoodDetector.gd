extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area:Area2D):
	#var prey = area as PreyFood
		#var prey := area as PreyFood

	area.owner.queue_free();
	Singletons.snakes.SpawnSnake(global_position);
	

	#area.parent.queue_free();
	#Singletons.snakes.SpawnSnake(global_position);

