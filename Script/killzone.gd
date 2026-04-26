extends Area2D

@onready var timer: Timer = $Timer
@onready var maneger: Node = %Maneger

func _on_body_entered(body: Node2D) -> void:
	print("hit Triagulo")
	maneger.lose_life()
