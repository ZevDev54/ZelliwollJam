extends CharacterBody2D


@export var speed := 200.0;

var moveDir = 0;
var remainingMoveTime = 0;

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(delta):
	if Input.is_action_pressed("right"):
		setMoveForTime(1, 1)

	if Input.is_action_pressed("left"):
		setMoveForTime(-1, 1)

func _physics_process(delta):

	#apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	#move snake if it still has move time left
	moveSnake(delta)

	#do the silly thingy :))))))
	move_and_slide()


func moveSnake(delta):
	if remainingMoveTime > 0:

		remainingMoveTime -= delta;
		print(remainingMoveTime)

		if moveDir:
			velocity.x = moveDir * SPEED
		else:
			velocity.x = 0;



func setMoveForTime(dir, time):
	moveDir = dir;
	remainingMoveTime = time;
	
func doJump():
	if !is_on_floor():
		return;

	velocity.y = JUMP_VELOCITY
