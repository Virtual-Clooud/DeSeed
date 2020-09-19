extends Node2D
onready var line = $Randrange
onready var timer = $Timer

var ball_position = 0
var ballInstance
#Preload das cenas de bolas de pontos
var ball = load("res://scenes/test_ball.tscn")
#Pegar um número entre 1 e x(tipos de bolas)
func _physics_process(delta):
	#Pegar uma localização aleatória da linha
	ball_position =  rand_range(line.get_point_position(1).y, line.get_point_position(0).y)
	ballInstance = ball.instance()
	ballInstance.set_position(Vector2(line.get_position().x,ball_position))
	
	print(get_tree().get_root())
#Spawnar a bola
#Fazer o pai dela ser a scene_tree
	add_child_below_node(get_node("/root"), ballInstance)
#Timer fazer uma contagem para dar intervalo entre os spawns

