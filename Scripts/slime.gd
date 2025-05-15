extends Node2D

var SPEED = 60

var direction = 1

@onready var wall_raycast_right: RayCast2D = $"Wall Raycast right"
@onready var wall_raycast_left: RayCast2D = $"Wall Raycast left"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player_detector_right: RayCast2D = $"Player detector right"
@onready var player_detector_left: RayCast2D = $"Player detector left"
@onready var timer: Timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if wall_raycast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	
	if wall_raycast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	
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
