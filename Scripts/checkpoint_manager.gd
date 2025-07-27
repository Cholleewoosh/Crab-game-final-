extends Node

var last_location
var player

# Tells the killzone where the players last checkpoint was
func _ready() -> void:
	player = get_parent().get_node("Player")
	last_location = player.global_position
