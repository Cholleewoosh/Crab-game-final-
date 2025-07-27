extends CharacterBody2D

var SPEED = 60
var direction = 1
const GRAVITY = 1000

# Sets the amount of damage dealt when touching the player
@export var damage_amount : int = 1

@onready var wall_raycast_right: RayCast2D = $"Wall Raycast right"
@onready var wall_raycast_left: RayCast2D = $"Wall Raycast left"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player_detector_right: RayCast2D = $"Player detector right"
@onready var player_detector_left: RayCast2D = $"Player detector left"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	enemy_gravity(delta)
	
	move_and_slide()

# Controls gravity of the enemy
func enemy_gravity(delta : float):
	velocity.y += GRAVITY * delta

# Tells the enemy to move forward until it hits a wall, then turn around and head back the otherway
func _process(delta: float) -> void:
	if wall_raycast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	
	if wall_raycast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	
	# Tells the enemy that, if it sees the player, to wait half a second, then chase after it at an increased speed.
	if player_detector_right.is_colliding():
		animated_sprite_2d.flip_h = false
		await get_tree().create_timer(0.5).timeout
		direction = 1
		
		position.x += 2 * direction * SPEED * delta
		
	if player_detector_left.is_colliding():
		animated_sprite_2d.flip_h = true
		await get_tree().create_timer(0.5).timeout
		direction = -1
		
		position.x += 2 * direction * SPEED * delta

		
	position.x += direction * SPEED * delta
