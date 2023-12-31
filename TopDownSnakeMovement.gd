extends RigidBody2D

@export var speed := 100;
@export var slowDownDistance := 500;

@export var deathFX: PackedScene;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):

	if !Input.is_action_pressed("leftclick"):
		return;

	var mouse_pos = get_global_mouse_position()
	var velocity_vector = mouse_pos - global_position;
	var distance = velocity_vector.length();

	var distAsPercent = distance / slowDownDistance;

	var slowdownMultiplier = clamp(distAsPercent, 0, 1);

	var normalized_velocity = velocity_vector.normalized()
	apply_central_force(normalized_velocity * speed * slowdownMultiplier); 

	#if distAsPercent < 1:
	#	apply_central_force(normalized_velocity * -speed * 1/distAsPercent); 


	#print(name+slowdownMultiplier);


#only called when contacts hazard layer items.
func _hurtbox_entered(area:Area2D):
	print("I die!");

	var current_scene = get_tree().get_current_scene()
	var instance : Node2D = deathFX.instantiate()
	current_scene.add_child(instance);

	instance.position = global_position;
	print(instance.name, instance.position)
	queue_free();
	
