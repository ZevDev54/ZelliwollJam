extends RigidBody2D

@export var speed := 200.0;

var moveDir = 0;
var remainingMoveTime = 0;



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if remainingMoveTime > 0:
		remainingMoveTime -= delta;

	#DEBUG CODE
	if Input.is_action_pressed("right"):
		setMoveForTime(1, 2)

	if Input.is_action_pressed("left"):
		setMoveForTime(-1, 2)

func _physics_process(delta):
	if moveDir != 0:
		add_constant_force(Vector2.RIGHT * moveDir * speed * delta);
		


func setMoveForTime(dir, time):
	moveDir = dir;
	remainingMoveTime = time;

