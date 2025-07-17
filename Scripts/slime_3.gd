extends CharacterBody2D

var spines_out = true

@export var damage_amount : int = 1
@onready var hurtbox: CollisionShape2D = $Hurtbox
@onready var hurtbox_indicator: AnimatedSprite2D = $Hurtbox_Indicator

func _ready() -> void:
	while spines_out == true:
		hurtbox.disabled = false
		hurtbox_indicator.visible = true
		await get_tree().create_timer(2).timeout
		hurtbox.disabled = true
		hurtbox_indicator.visible = false
		await get_tree().create_timer(1.5).timeout
		
