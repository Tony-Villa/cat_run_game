extends CharacterBody2D

@export var horizontal_speed: float = 0
@export var vertical_speed: float = 0

var player: CharacterBody2D
var base_speed: int = 10


func _ready():
	player = get_tree().get_first_node_in_group("player")
	if player == null:
		print("Error: Need to put player in scene!")


func _process(_delta):
	if player == null:
		pass
		
	move()


func move():
	var y = get_y_offset()
	var direction = Vector2(horizontal_speed, y)
	velocity = direction * base_speed
	move_and_slide()


func get_y_offset():
	var y = 0
	
	if position.y < player.position.y:
		if player.position.y - position.y > 5:
			y += vertical_speed
		y += 0.1
		
	if position.y > player.position.y:
		if position.y - player.position.y > 5:
			y -= vertical_speed
		y -= 0.1
		
	return y
