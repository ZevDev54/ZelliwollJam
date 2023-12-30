extends Node2D

@export var lerpSpeed : float = 5.0;

@export var particles: CPUParticles2D

func _ready():
	particles.emitting = false;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.lerp(get_global_mouse_position(), lerpSpeed * delta);

	if Input.is_action_just_pressed("leftclick"):
		particles.emitting = true
	if Input.is_action_just_released("leftclick"):
		particles.emitting = false;
