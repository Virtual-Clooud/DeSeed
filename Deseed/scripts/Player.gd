extends Node2D
var point_count = 0
onready var player = $Seed
onready var block_area = $block_area
onready var point_detector = $point_detector
func _on_Seed_move(can_move): #Quando bola começar a se mover
	if can_move == true:
		point_count = point_count + 1
func _on_point_detector_area_entered(area):#Quando detectar colisão com bola de pontos
	if area.is_in_group("point1"):
		point_count = point_count + 500
func _physics_process(delta):
	block_area.set_global_position(player.get_global_position()) #Fazer a área de bloco seguir o jogador
	point_detector.set_global_position(player.get_global_position()) #mema coisa
	print(point_count)


