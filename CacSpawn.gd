extends Timer

@export var screenWidth : float = 5000
var spawnTime : float = 1;
@export var minSpawnTime := 2.0
@export var maxSpawnTime := 4.0

@export var spawnItem : PackedScene;
var loaded;

@export var spawnNode : Node2D;

@export var speedupRate := 0.005;

func _ready():
	loaded = ResourceLoader.load(spawnItem.resource_path);

func findPos():
	print(spawnNode.global_position);
	return spawnNode.global_position + Vector2(randf_range(-screenWidth/2, screenWidth/2), 0)

func _on_timer_timeout():

	var spawned = spawnItem.instantiate()
	add_child(spawned)
	spawned.global_position = findPos();
	#spawned.global_position = spawnNode.global_position;
	print(spawned.name, spawned.global_position);
	spawnTime = randf_range(minSpawnTime, maxSpawnTime)
	wait_time = spawnTime

	minSpawnTime -= speedupRate;
	maxSpawnTime -= speedupRate;


	minSpawnTime = clamp(minSpawnTime, 0.4, 1000)
	maxSpawnTime = clamp(maxSpawnTime, 0.4, 1000)
	print(minSpawnTime);


