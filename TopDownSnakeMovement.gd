extends RigidBody2D

@export var speed := 100;
@export var slowDownDistance := 500;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	var velocity_vector = mouse_pos - global_position;
	var distance = velocity_vector.length();

	var distAsPercent = distance / slowDownDistance;

	var slowdownMultiplier = clamp(distAsPercent, 0, 1);

	var normalized_velocity = velocity_vector.normalized()
	apply_central_force(normalized_velocity * speed * slowdownMultiplier);

	#print(name+slowdownMultiplier);


