extends RigidBody2D

var pullSpeed := 5000;
var pushSpeed := 10000;
var mouse_pos
var slowdownMultiplier 
var normalized_velocity
var friction 

@export var slowDownDistance := 500;
@export var time_held := 0



var tween = create_tween()



var total = 0
const MOVE_SPEED = 300

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(delta):

	velocity -= friction

	if Input.is_action_pressed("Pull"):
		mouse_pos = get_global_mouse_position()
		total += delta
		



		
	if Input.is_action_just_released("Pull"):
		var timer : Timer = Timer.new()
		add_child(timer)

		
		timer.wait_time = total
		timer.one_shot = true
		timer.timeout.connect(stopPull)
		timer.start()
		
		pullSpeed = 5000
		
		
		print("WORK")
		
		var velocity_vector = mouse_pos - global_position;
		var distance = velocity_vector.length();
	
		var distAsPercent = distance / slowDownDistance;
	
		slowdownMultiplier = clamp(distAsPercent, 0, 1);
	
		normalized_velocity = velocity_vector.normalized()

		apply_central_force(normalized_velocity * pullSpeed * slowdownMultiplier);

		


	
	



	if Input.is_action_just_pressed("Push"):
		mouse_pos = get_global_mouse_position()
		var velocity_vector = mouse_pos - global_position;
		var distance = velocity_vector.length();
	
		var distAsPercent = slowDownDistance / distance;
	
		slowdownMultiplier = clamp(distAsPercent, 0, 1);
	
		normalized_velocity = velocity_vector.normalized()

		apply_central_force(normalized_velocity * pushSpeed * slowdownMultiplier * -1);


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

func stopPull():
	friction = 300


