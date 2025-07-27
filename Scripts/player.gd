extends CharacterBody2D

# Control speed and jump height
const SPEED = 150.0
const JUMP_VELOCITY = -300.0

@onready var camera = $Camera2D

func _physics_process(delta: float) -> void:
	# Adds the gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Makes the player jump when the spacebar is pressed
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Makes the player move left and right when the respective buttons are pressed
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

# Tells the health manager to remove a life when colliding with an enemy
func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		print("Owie", body.damage_amount)
		HealthManager.decrease_health(body.damage_amount)
