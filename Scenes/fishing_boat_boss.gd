extends CharacterBody2D

@onready var camera = find_child("Cutscene_Camera")
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_cutscene = false
var has_player_entered_area = false
var player = null

var is_pathfollowing = false

func _physics_process(delta: float) -> void:
	if is_cutscene:
		var pathfollower = find_child("PathFollow2D")
		
		if is_pathfollowing:
			pathfollower.progress_ratio += 0.006
			
			if pathfollower.progress_ratio >= 0.98:
				cutsceneending()
				

func _on_detection_box_body_entered(body: Node2D) -> void:
	if body.has_method("Player"):
		player = body
		if !has_player_entered_area:
			has_player_entered_area = true
			cutscene()

func cutscene():
	is_cutscene = true
	player.camera.enabled = false
	camera.enabled = true
	is_pathfollowing = true
	await get_tree().create_timer(4).timeout
	animated_sprite.play("Sinking")

func cutsceneending():
	await get_tree().create_timer(3).timeout
	is_pathfollowing = false
	is_cutscene = false
	camera.enabled = false
	player.camera.enabled = true
