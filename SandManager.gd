extends Node2D

@export var sandParent : Node2D;
@export var resetSandPoint : Node2D;



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for sand in sandParent.get_children():
		var sand2d = sand as Node2D;
		sand2d.position += Vector2(0, Speedmanager.speed * delta);
		if (sand2d.position.y > resetSandPoint.position.y):
			sand2d.position = Vector2.ZERO;

	# if(sandParent.get_child_count() <= 3):
	# 	if()
	# 		var spawnedSand = sandBackground.instantiate();
	# 		sandParent.add_child(spawnedSand);
