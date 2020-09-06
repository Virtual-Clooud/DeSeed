extends Node2D 
onready var player = $Seed
onready var block_area = $block_area
func _physics_process(delta):
	block_area.set_global_position(player.get_global_position()) #Make the block_area follow the player
