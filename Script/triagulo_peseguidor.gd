extends RigidBody2D

@onready var maneger: Node
@onready var soldado: CharacterBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var fim_ataque: AnimationPlayer = $FimAtaque

var speedT = 500
var tragetoria = 0
var recaculoNum = 3
const CORDX = 576.0
const CORDY = 324.0
var miravel = true
var num : int 

func _ready() -> void:
	gravity_scale = 0.0
	lock_rotation = true
	
	
	randomize()
	var xrand = randi_range(0, 1)
	if xrand == 0 :
		position.x = CORDX*.20
	else:
		position.x = CORDX*1.80
	position.y = randf_range((CORDY*0.50), (CORDY * 1.50))
	for i in recaculoNum:
		animation_player.queue("TrianguloAnimation")


func _process(delta: float) -> void:
	if miravel:
		mirando()
	elif (animation_player.current_animation_position >= (animation_player.current_animation_length * 0.9) && fim_ataque.is_playing() != true):
		miravel = true
	

func mirando():
	tragetoria = soldado.position
	look_at(tragetoria)

func shot():
	linear_velocity = Vector2(tragetoria - position).normalized() * speedT
	miravel = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hit Triagulo")
	maneger.lose_life()

func fimAtaque():
	num += 1
	if num >= recaculoNum:
		fim_ataque.play("FimAtaqueAnimacao")
