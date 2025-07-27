extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# If the player enters the body of the node, this adds 1 to the level it should be on
	if body.is_in_group("Player"):
		print("level switched")
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		
		# changes the scene that should be loaded
		var next_level_path = "res://Scenes/Level_" + str(next_level_number) + ".tscn"
		get_tree().change_scene_to_file(next_level_path)
