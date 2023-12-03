extends Node3D

@export var spawny = preload("res://scenes/enemy.tscn")

func spawn_enemy():
	var obj = spawny.instantiate()

	get_tree().root.add_child(obj)

	obj.global_position = global_position
	obj.global_position.y = 21

func _on_timer_timeout():
	spawn_enemy()
