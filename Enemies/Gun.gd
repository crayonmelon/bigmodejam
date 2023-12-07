extends Node3D

var enemy_bullet = preload("res://scenes/enemy_bullet.tscn")


func _on_timer_timeout():
	var enemy = enemy_bullet.instantiate()
	
	get_tree().root.add_child(enemy)
	enemy.position = global_position
	enemy.rotation = global_rotation
