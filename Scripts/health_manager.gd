extends Node

# Sets the max health amount and the current health as an interger
var max_health : int = 2
var current_health : int

signal on_health_changed

func _ready() -> void:
	current_health = max_health
	
# Controls the taking of damage, and sends out a signal to take a shell away when damaged
func decrease_health(health_amount : int):
	current_health -= health_amount
	
	# When the player reaches zero lives, this resets the scene and puts their health to max
	if current_health < 0:
		current_health = 0
		get_tree().reload_current_scene()
		current_health = max_health
	
	print("decrease health")
	on_health_changed.emit(current_health)

# Controls the gaining of health from health pickups, and sends out a signal to add a shell when pickup is collected

func increase_health(health_amount : int):
	current_health += health_amount
	
	# Makes sure that your health can't go over max
	if current_health > max_health:
		current_health = max_health
	print("increase health")
	on_health_changed.emit(current_health)
