extends Node2D

const SPEED = 200

var direction = 1
var bounce : int 
var multSpeed : int = 1

@onready var ray_right: RayCast2D = $RayRight
@onready var ray_left: RayCast2D = $RayLeft

func _process(delta: float) -> void:
	direction_change()	
	if bounce > 3:
		queue_free()
	position.x += direction * (SPEED * multSpeed) * delta 

func direction_change():
	if ray_right.is_colliding():
		direction = -1
		bounce += 1
		multSpeed += bounce 
	if ray_left.is_colliding():
		direction = 1
		bounce += 1
		multSpeed += bounce
