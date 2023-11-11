extends CharacterBody2D

enum State {
	Idle,
	Run,
	Dash
}

@export var base_speed = 0

var current_state: State = State.Idle


func _ready():
	pass


func _process(_delta):
	match current_state:
		State.Idle:
			print("Idle")
			process_idle()
		State.Run:
			print("Run")
			process_run()
		State.Dash:
			print("Dash")
	

func process_idle():
	var movement_vector = get_movement_vector()
	if movement_vector != Vector2(0,0):
		current_state = State.Run	
	
	
func process_run():
	var movement_vector = get_movement_vector()
	if movement_vector == Vector2(0,0):
		current_state = State.Idle
		return
	
	var direction = movement_vector.normalized()
	velocity = direction * base_speed
	move_and_slide()
	
	
func process_dash():
	pass
	
		
func get_movement_vector():
	var x_movement = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_movement = Input.get_action_strength("down") - Input.get_action_strength("up")
	return Vector2(x_movement, y_movement)
