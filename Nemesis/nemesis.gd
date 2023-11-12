extends CharacterBody2D

@export var base_speed: int = 0

var player: CharacterBody2D

func _ready():
	player = get_tree().get_first_node_in_group("player")
	if player == null:
		print("Error: Need to put player in scene!")


func _process(delta):
	if player == null:
		pass
		
	var direction = Vector2(1,0)
	velocity = direction * base_speed
	move_and_slide()
