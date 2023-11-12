extends Node2D


func _ready():
	$Area2D.body_entered.connect(on_body_entered)


func _process(delta):
	pass


func on_body_entered(_player: Node2D):
	LevelManager.load_next_level()
