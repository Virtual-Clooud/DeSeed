extends Control
#

onready var tab = $ColorRect
func _ready():
	tab.set_visible(false)
func _on_Seed_game_over():
	tab.set_visible(true)
