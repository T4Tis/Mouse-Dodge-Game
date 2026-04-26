extends Node2D

var laserPath := preload("res://Scenes/laser.tscn")
var triaguloPath := preload("res://Scenes/triagulo_peseguidor.tscn")
var circuloPath := preload("res://Scenes/circulo_miti_attack.tscn")
@onready var ataque_simples: AnimationPlayer = $AtaqueSimples
@onready var triangulo_ataque: AnimationPlayer = $TrianguloAtaque
@onready var circulo_ataque: AnimationPlayer = $CirculoAtaque
@onready var attack: AnimationPlayer = $Attack

@onready var button: Button = $"../Button"
@onready var duracao_ataque: Timer = $DuracaoAtaque

var velo = 0.0
var posiY : float

func _process(delta: float) -> void:
	#laser
	if Input.is_action_just_pressed("ui_down"):
		velo = velo + 1.0
		ataque_simples.speed_scale = velo
		ataque_simples.play("Rapido1raio")
	#triagulo
	if Input.is_action_just_pressed("ui_up"):
		triangulo_ataque.play("rapidoTriangulo1")
	#circulo
	if Input.is_action_just_pressed("ui_right"):
		for i in 5:
			circulo_ataque.queue("SimplesCirculo")
	#cancela tudo
	if Input.is_action_just_pressed("ui_cancel"):
		ataque_simples.stop()
		triangulo_ataque.stop()
		circulo_ataque.stop()

func createLaser():
	var laser = laserPath.instantiate()
	laser.position.x = 576
	laser.maneger = %Maneger
	add_child(laser)

func createTriangulo():
	var triangulo = triaguloPath.instantiate()
	triangulo.maneger = %Maneger
	triangulo.soldado = $"../Soldado"
	add_child(triangulo)

var posicaomuda := false
func createCiculo():
	if posicaomuda == true:
		posiY = 45
		posicaomuda = false
	else:
		posiY = 0
		posicaomuda = true
	
	for e in 9:
		var circulo = circuloPath.instantiate()
		circulo.maneger = %Maneger
		circulo.soldado = $"../Soldado"
		circulo.newPosiY = (90 * e) - posiY 
		add_child(circulo)
	

func _on_button_pressed() -> void:
	padraoAttack()
	button.queue_free()
	pass # Replace with function body.

func padraoAttack():
	
	attack.play("padraoDeAttack")
	
	
	#duracao_ataque.start()
	#ataque_simples.play("Rapido1raio")
	#if duracao_ataque.is_stopped():
		#ataque_simples.stop()
		#triangulo_ataque.play("rapidoTriangulo1")
		#
		#circulo_ataque.play("SimplesCirculo")
	
	pass
