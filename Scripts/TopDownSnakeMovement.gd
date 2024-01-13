extends RigidBody2D

@export var speed := 100;


@export var deathFX: PackedScene;

@export var slowdownMultiplier := 1.0;
@export var slowdownDistance := 50.0;

@export var maxSlowPower = 0.9;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	#Is the player using the flute?
	if !Input.is_action_pressed("leftclick"):
		#If player is not using flute, apply slow down to brake the snake's moevement.
		slowdown(delta, slowdownMultiplier)
		#Return- do nothing else, skips the move towards cursor code. A bit cleaner than if/else, avoid nesting
		return;

	var mouse_pos = get_global_mouse_position()
	var velocity_vector = mouse_pos - global_position;
	var distance = velocity_vector.length();

	#Get signed distance to the cursor. If within slowdownDistance radius, the value is positive.
	var signedDistance = slowdownDistance - distance;
	if(signedDistance > 0):
		#Get the 0-1 distance percentage.
		var distAsPercent = slowdownDistance / distance;
		distAsPercent = clamp(distAsPercent, 0, maxSlowPower);
		#Add slowdown force- stronger the closer to the cursor.
		slowdown(delta, distAsPercent * slowdownMultiplier);


	var normalized_velocity = velocity_vector.normalized()
	apply_central_force(normalized_velocity * speed); 

func slowdown(delta:float, amount:float):
	var velocityCopy = linear_velocity;
	var slowdownVector : Vector2 = velocityCopy.lerp(Vector2.ZERO, delta); 
	apply_central_force(-slowdownVector * amount)

#only called when contacts hazard layer items.
func _hurtbox_entered(area:Area2D):
	print("I die!");

	#get curresnt scene, spawn death fx object, parent death fx object to the scene tree.
	var current_scene = get_tree().get_current_scene()
	var instance : Node2D = deathFX.instantiate()
	current_scene.add_child(instance);

	#position the death fx at the snakes position, then..
	instance.position = global_position;
	print(instance.name, instance.position)
	#remove self.
	queue_free();
	
