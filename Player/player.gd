extends CharacterBody2D

enum State {
	Idle,
	Run,
	Dash,
	Stun
}

@export var base_speed: int = 0
@export var dash_speed: int = 0
@export var dash_rate: float = 0
@export var stun_rate: float = 0

var current_state: State = State.Idle
var dash_direction: Vector2 = Vector2(0,0)
var dash_cooldown: float = dash_rate
var stun_cooldown: float = stun_rate

func _ready():
	pass


func _process(delta):
	var movement_vector = get_movement_vector()
	
	match current_state:
		State.Idle:
			print("Idle")
			process_idle(movement_vector)
		State.Run:
			print("Run")
			process_run(movement_vector)
		State.Dash:
			print("Dash")
			process_dash(delta)
		State.Stun:
			print("Stun")
			process_stun(delta)
	

func process_idle(movement_vector: Vector2):
	if movement_vector != Vector2.ZERO:
		current_state = State.Run	
	
	
func process_run(movement_vector: Vector2):
	if movement_vector == Vector2.ZERO:
		current_state = State.Idle
		return
	
	if Input.is_action_pressed("dash"):
		dash_direction = movement_vector.normalized()
		dash_cooldown = 0
		current_state = State.Dash
		return
		
	var direction = movement_vector.normalized()
	velocity = direction * base_speed
	move_and_slide()
	
	
func process_dash(delta):
	dash_cooldown += delta
	if dash_cooldown > dash_rate:
		stun_cooldown = 0
		current_state = State.Stun
		return
		
	velocity = dash_direction * base_speed * (1 + (dash_speed / 100))
	move_and_slide()
	

func process_stun(delta):
	stun_cooldown += delta
	if stun_cooldown > stun_rate:
		current_state = State.Idle
		return
	
		
func get_movement_vector():
	var x_movement = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_movement = Input.get_action_strength("down") - Input.get_action_strength("up")
	return Vector2(x_movement, y_movement)
