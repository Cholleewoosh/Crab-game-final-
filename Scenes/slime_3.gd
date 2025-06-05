extends CharacterBody2D

var spines_out = true

@export var damage_amount : int = 1
@onready var hurtbox: CollisionShape2D = $Hurtbox

func _ready() -> void:
	while spines_out == true:
		hurtbox.disabled = false
		await get_tree().create_timer(1.5).timeout
		hurtbox.disabled = true
		await get_tree().create_timer(1).timeout
		
