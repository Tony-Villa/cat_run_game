extends Node

var current_level = 1

func _ready():
	pass


func _process(delta):
	pass


func load_next_level():
	match current_level:
		1:
			current_level = 2
			get_tree().change_scene_to_file("res://Levels/Level_2.tscn")
