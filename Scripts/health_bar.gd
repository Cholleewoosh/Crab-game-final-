extends Node2D


@export var FullShell : Texture2D
@export var EmptyShell : Texture2D

# Makes all shells full when the game starts
@onready var shell_1: Sprite2D = $FullShell1
@onready var shell_2: Sprite2D = $FullShell2
@onready var shell_3: Sprite2D = $FullShell3

# Connects the health bar and health manager 
func _ready() -> void:
	HealthManager.on_health_changed.connect(on_player_health_changed)
	
	
# Tells the first shell to become empty when the plauer is on 2 lives
func on_player_health_changed(player_current_health : int):
	if player_current_health == 2:
		shell_3.texture = FullShell
	elif player_current_health < 2:
		shell_3.texture = EmptyShell
		
		
# Tells the second shell to become empty when the plauer is on 1 lives
	if player_current_health == 1:
		shell_2.texture = FullShell
	elif player_current_health < 1:
		shell_2.texture = EmptyShell
		
		
# Tells the last shell to become empty when the plauer is on 0 lives
	if player_current_health == 0:
		shell_1.texture = FullShell
	elif player_current_health < 0:
		shell_1.texture = EmptyShell
