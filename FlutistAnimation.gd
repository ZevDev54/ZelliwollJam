extends AnimationPlayer

@export var auido : AudioRandom

func _process(delta):
	if Input.is_action_just_pressed("leftclick"):
		play("Playing")
		auido.PlayRandomTrack()
	if Input.is_action_just_released("leftclick"):
		play("Idle")