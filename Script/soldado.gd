extends CharacterBody2D

const SPEED = 500

func _physics_process(delta):
	var move = (get_global_mouse_position() - global_position) * SPEED
	velocity = move * delta
	move_and_slide()
