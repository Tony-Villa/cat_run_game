extends CharacterBody2D

enum State {
	Idle,
	Move
}

@export var base_speed: int = 0
@export var move_time_rate: float = 0
@export var move_cooldown_rate: float = 0

var current_state: State = State.Idle
var direction: Vector2 = Vector2.ZERO
var move_time = move_time_rate
var move_cooldown = move_cooldown_rate


func _ready():
	pass


func _process(delta):
	match current_state:
		State.Idle:
			process_idle(delta)
		State.Move:
			process_move(delta)


func process_idle(delta):
	move_cooldown += delta
	if move_cooldown > move_cooldown_rate:
		move_time = 0
		set_direction()
		current_state = State.Move


func process_move(delta):
	move_time += delta
	if move_time > move_time_rate:
		move_cooldown = 0
		current_state = State.Idle
		return

	velocity = direction * base_speed
	move_and_slide()	
	

func set_direction():
	var new_rotation = randf_range(0, TAU)
	direction = Vector2.UP.rotated(new_rotation)
	rotation = new_rotation
	
