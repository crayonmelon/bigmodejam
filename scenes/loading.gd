extends Node3D

func _ready():
	await get_tree().create_timer(.3).timeout
	get_tree().change_scene_to_file("res://scenes/Main_Game.tscn")
