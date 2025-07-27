extends CharacterBody2D

@onready var camera = find_child("Cutscene_Camera")
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_cutscene = false
var has_player_entered_area = false
var player = null

var is_pathfollowing = false

# Tells the camera to follow the path, at how fast, and when to stop.
func _physics_process(delta: float) -> void:
	if is_cutscene:
		var pathfollower = find_child("PathFollow2D")
		
		if is_pathfollowing:
			pathfollower.progress_ratio += 0.006
			
			if pathfollower.progress_ratio >= 0.98:
				cutsceneending()
				

# Detects if the player is in the area for the cutscene to start
func _on_detection_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player = body
		if !has_player_entered_area:
			has_player_entered_area = true
			cutscene()

# Takes the camera away from the player, tells it to start following the path, and tells the boat when to play its sinking sprite
func cutscene():
	is_cutscene = true
	player.camera.enabled = false
	camera.enabled = true
	is_pathfollowing = true
	await get_tree().create_timer(4).timeout
	animated_sprite.play("Sinking")

# Returns the camera back to the player three seconds after the camera has stopped following the path.
func cutsceneending():
	await get_tree().create_timer(3).timeout
	is_pathfollowing = false
	is_cutscene = false
	camera.enabled = false
	player.camera.enabled = true
