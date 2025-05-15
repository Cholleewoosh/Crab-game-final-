extends Node

var max_health : int = 2
var current_health : int

func _ready() -> void:
	current_health = max_health
	
func decrease_health(health_amount : int):
	current_health -= health_amount
	
	if current_health < 0:
		current_health = 0
		get_tree().reload_current_scene()
		current_health = max_health
	
	print("decrease health")

func increase_health(health_amount : int):
	current_health += health_amount
	
	if current_health > max_health:
		current_health = max_health
	print("increase health")
	
