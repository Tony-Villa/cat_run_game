extends Camera2D

@export var camera_offset: int = 0

var nemesis: CharacterBody2D


func _ready():
	nemesis = get_tree().get_first_node_in_group("nemesis")
	if nemesis == null:
		print("Error: Need to put Nemesis in scene!")

func _process(_delta):
	if nemesis == null:
		pass
		
	global_position = nemesis.global_position + Vector2(camera_offset,0)
