extends Node3D

@export var spawny = preload("res://scenes/enemy.tscn")

func spawn_enemy():
	var obj = spawny.instantiate()
	obj.global_position = position
	add_child(obj)

func _on_timer_timeout():
	spawn_enemy()
