extends Node2D








func _on_point_area_area_shape_entered(area_id, area, area_shape, self_shape):
	queue_free()
