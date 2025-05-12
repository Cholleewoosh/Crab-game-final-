extends Node2D

var SPEED = 60

var direction = 1

@onready var wall_raycast_right: RayCast2D = $"Wall Raycast right"
@onready var wall_raycast_left: RayCast2D = $"Wall Raycast left"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player_detector_right: RayCast2D = $"Player detector right"
@onready var player_detector_left: RayCast2D = $"Player detector left"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if wall_raycast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	
	if wall_raycast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	
	if player_detector_right.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
		SPEED *= 1.5
		
	if player_detector_left.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
		SPEED *= 1.5

		
	position.x += direction * SPEED * delta
