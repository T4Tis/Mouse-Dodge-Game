extends StaticBody2D

@onready var maneger: Node
@onready var soldado
@onready var animation_player: AnimationPlayer = $AnimationPlayer

const CORDX = 576.0
const CORDY = 324.0
var speed = 200
var newPosiY: float
var valido = false

func _ready() -> void:
	randomize()
	position.x = (CORDX * 1.8) 
	position.y = ((CORDY * 0.20)*-1) + newPosiY
	animation_player.play("CirculoAnimation")



func _process(delta: float) -> void:
	if animation_player.is_playing() == false || valido == true:
		position.x -= speed * delta
		valido = true
		animation_player.play("Fim_ataque")
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Hit Circulo")
	maneger.lose_life()
