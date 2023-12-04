extends Node3D

@export var grid_size = 4
var enemy = preload("res://scenes/enemy.tscn")
var spacing = 2

func _ready():
	spawn_grid()

func spawn_grid():
	global_position.x = randi_range(GameManager.WORLD_BORDER_X_MIN, GameManager.WORLD_BORDER_X_MAX)
	grid_size = randi_range(2,6)
	
	for x in range(1,grid_size+1):
		for y in range(1,grid_size+1):
				
				var obj = enemy.instantiate()
				get_tree().root.add_child(obj)
				obj.global_position = global_position + Vector3(spacing*x,0,spacing*y)
				obj.global_position.y = 21


func _on_timer_timeout():
	spawn_grid()
