extends RigidBody2D

@export var speed := 100;
@export var slowDownDistance := 500;

const MOVE_SPEED = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(	delta):


	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):

		var mouse_pos = get_global_mouse_position()
		var velocity_vector = mouse_pos - global_position;
		var distance = velocity_vector.length();
	
		var distAsPercent = distance / slowDownDistance;
	
		var slowdownMultiplier = clamp(distAsPercent, 0, 1);
	
		var normalized_velocity = velocity_vector.normalized()

		apply_central_force(normalized_velocity * speed * slowdownMultiplier);


	var move_vec = Vector2()
	if Input.is_action_pressed("Up"):
		move_vec.y -= 20
	if Input.is_action_pressed("Down"):
		move_vec.y += 20
	if Input.is_action_pressed("Left"):
		move_vec.x -= 20
	if Input.is_action_pressed("Right"):
		move_vec.x += 20
	move_vec = move_vec.normalized()
	move_and_collide(move_vec * MOVE_SPEED * delta)
	
	#print(name+slowdownMultiplier);


