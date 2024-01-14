class_name TopDownSnakeMovement;
extends RigidBody2D

@export var speed := 100;


@export var deathFX: PackedScene;

@export var slowdownMultiplier := 1.0;
@export var slowdownDistance := 50.0;

@export var maxSlowPower = 0.9;

@export var slideCounterForcePercent = 0.5;

var boundaryPushForce : Vector2;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var allowSlowdown := true;

	if(boundaryPushForce != Vector2.ZERO):
		apply_impulse(boundaryPushForce*delta);
		print("Actualized push! Push vec is",boundaryPushForce)
		boundaryPushForce = Vector2.ZERO;
		allowSlowdown = false;
		

	#Is the player using the flute?
	if !Input.is_action_pressed("leftclick"):
		#If player is not using flute, apply slow down to brake the snake's moevement.
		if(allowSlowdown):
			slowdown(delta, slowdownMultiplier)
		#Return- do nothing else, skips the move towards cursor code. A bit cleaner than if/else, avoid nesting
		return;

	moveTowardsMouse(delta, allowSlowdown);
	


func moveTowardsMouse(delta, allowSlowdown):
	var mouse_pos = get_global_mouse_position()

	var mouseDifference = mouse_pos - global_position;
	var mouseDirection = mouseDifference.normalized();

	var mouseDistance = mouseDifference.length();

	#Get signed distance to the cursor. If within slowdownDistance radius, 
	#i.e the value is positive, and applies a braking force through slowdown() function.
	var signedDistance = slowdownDistance - mouseDistance;
	if(signedDistance > 0):
		#Get the 0-1 distance percentage.
		var distAsPercent = slowdownDistance / mouseDistance;
		distAsPercent = clamp(distAsPercent, 0, maxSlowPower);
		#Add slowdown force- stronger the closer to the cursor.
		if(allowSlowdown):
			slowdown(delta, distAsPercent * slowdownMultiplier);

	#To make the snakes change direction more snappily,
	#take the negative component of the dot product between 
	#the current velocity-direction and the mouse direction, and multiply speed accordingly.
	var directionDotProduct = linear_velocity.dot(mouseDirection);
	var positiveDotProduct:float = clamp(-directionDotProduct, 0, 1)
	var counterforce = (1+positiveDotProduct*slideCounterForcePercent);

	print("direction dot product: ",directionDotProduct, " Positive only dot product: ",positiveDotProduct," slide counterforce: ",counterforce);
	

	apply_central_force(mouseDirection * counterforce * speed); 







func slowdown(delta:float, amount:float):
	var velocityCopy = linear_velocity;
	var slowdownVector : Vector2 = velocityCopy.lerp(Vector2.ZERO, delta); 
	apply_central_force(-slowdownVector * amount)


func boundaryPush(pushForce : Vector2):
	boundaryPushForce = pushForce;
	print("Set push force variable for later push handling..")




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
	
