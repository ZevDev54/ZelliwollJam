extends Area2D

@export var rigidbody : RigidBody2D;
@export var boundaryRepulseForce := 10.0;

var borderContact : Area2D = null;

# func _process(delta):
# 	# if borderContact:
# 		# var lerpVector = rigidbody.global_position.lerp(Vec
# 		# rigidbody.apply_central_force()