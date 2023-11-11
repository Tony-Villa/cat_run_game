extends CharacterBody2D

@export var base_speed = 150


func _ready():
	pass


func _process(delta):
	move()
	
	
func move():
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	velocity = direction * base_speed
	move_and_slide()
	
		
func get_movement_vector():
	var x_movement = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_movement = Input.get_action_strength("down") - Input.get_action_strength("up")
	return Vector2(x_movement, y_movement)
