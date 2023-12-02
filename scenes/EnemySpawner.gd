extends Node3D

@export var spawny = preload("res://scenes/enemy.tscn")
@export var height = 21

func spawn_enemy():
	var obj = spawny.instantiate()
	$"../../Node3D".add_child(obj)
	obj.global_position = global_position
	obj.global_position.y = height
	
func _on_timer_timeout():
	spawn_enemy()
	
