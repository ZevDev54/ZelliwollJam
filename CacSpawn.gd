extends Timer

@export var screenWidth : float = 5000
@export var spawnTime : float = 1;
@export var spawnItem : PackedScene;

@export var spawnNode : Node2D;

func _ready():
	print("Awake and ready for cactussy")

func findPos():
	return spawnNode.global_position + Vector2(randf_range(-screenWidth/2, screenWidth/2), 500)

func _on_timer_timeout():
	print("sex time! (cactussssssy)")
	var spawned = spawnItem.instantiate()
	spawned.global_position = findPos();
	add_child(spawned)
	spawnTime = randf_range(3.0, 5.0)
	wait_time = spawnTime
