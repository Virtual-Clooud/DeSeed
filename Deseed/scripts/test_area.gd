extends Node2D


func _physics_process(delta):
	#Make square follow mouse
	$Area2D.set_global_position(get_global_mouse_position())
