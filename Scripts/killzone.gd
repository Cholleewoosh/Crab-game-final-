extends Area2D

var checkpoint_manager
var player

# Calls on the checkpoint managaer and the player
func _ready() -> void:
	checkpoint_manager = get_parent().get_node("Checkpoint_Manager")
	player = get_parent().get_node("Player")

#Sends the player back to the checkpoint when touched
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		killPlayer()
		

# Tells the player where the checkpoint is
func killPlayer():
	player.position = checkpoint_manager.last_location
