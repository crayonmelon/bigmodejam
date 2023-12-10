extends Node3D

var enemy_bullet = preload("res://scenes/enemy_bullet.tscn")

func _ready():
	await get_tree().create_timer(4.0).timeout 
	queue_free()

func _on_timer_timeout():
	var enemy = enemy_bullet.instantiate()
	
	enemy.position = global_position
	enemy.rotation = global_rotation	
	get_tree().root.add_child(enemy)
	
