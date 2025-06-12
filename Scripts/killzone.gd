extends Area2D

@onready var timer: Timer = $Timer
@export var damage_amount : int = 3

func _on_body_entered(body: Node2D) -> void:
	print("You are died!")
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
