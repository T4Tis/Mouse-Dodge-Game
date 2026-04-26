extends Area2D

@onready var maneger : Node
@onready var animation_player: AnimationPlayer = $AnimationPlayer

const CORDX = 576.0
const CORDY = 324.0

func _ready() -> void:
	randomize()
	position.x = randf_range((CORDX * 0.50), (CORDX * 1.50))
	position.y = randf_range((CORDY*0.50), (CORDY * 1.50))
	rotation = randf_range(-90.0, 90.0)
	animation_player.play("laserAnimation")


func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print("hit Laser")
	maneger.lose_life()
