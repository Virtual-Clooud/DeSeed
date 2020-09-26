extends Area2D

var block
func _ready():
	block = preload("res://scenes/test_block.tscn")


func _on_RayCast2D_area_entered(area):
	if area.is_in_group("player"):
		add_child(block)
