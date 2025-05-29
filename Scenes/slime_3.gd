extends CharacterBody2D

var attack = true

@export var damage_amount : int = 1
@onready var hurtbox: CollisionShape2D = $Hurtbox

func _process(delta: float) -> void:
	if attack == true:
		hurtbox.disabled = true
		await get_tree().create_timer(3).timeout
		attack = false
		
	if attack == false:
		hurtbox.disabled = false
		await get_tree().create_timer(0.5).timeout
		attack = true
