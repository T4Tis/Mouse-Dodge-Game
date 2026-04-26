extends Node

var life = 3
@onready var life_label: Label = $LifeLabel
@onready var timer: Timer = $Timer
@onready var soldado: CharacterBody2D = $"../Soldado"

func _ready():
	life_label.text = "Vida: " + str(life)
	

func lose_life():
	life -= 1
	life_label.text = "Vida: " + str(life)
	if life <= 0:
		Engine.time_scale = 0.2
		timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	pass # Replace with function body.
