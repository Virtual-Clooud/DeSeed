extends Area2D

#Carregar o recurso do bloco
var block = load("res://scenes/block.tscn")
#Será usado para a instância do bloco
var next_block
#Definir limite para spawn de bloco
var can_spawn = true

func _on_player_area_entered(area):
	
	#Se a área de spawn fizer contato e o bloco puder spawnar
	if can_spawn == true and area.is_in_group("player"):
		
		#Instância o bloco quando pode spawnar
		next_block = block.instance()
		#Definir a posição do bloco
		next_block.set_position($ray.get_position() + Vector2(200, 0))
		#Adicionar bloco
		add_child(next_block)
		#Dar limite
		can_spawn = false
func _physics_process(delta):
	randomize()
