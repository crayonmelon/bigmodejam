extends Node3D

var enemy = preload("res://scenes/EnemySpawnPattern/Barrier/bloons.tscn")

func _ready():
	Spawn_ladder_Upper()

func Spawn_ladder_Upper():
	global_position.x = randi_range(GameManager.WORLD_BORDER_X_MIN -10, GameManager.WORLD_BORDER_X_MAX +10)
	global_position.y = randi_range(-5, 20)

	var obj = enemy.instantiate()
	get_tree().root.add_child(obj)
	obj.global_position = global_position

func _on_timer_timeout():
	Spawn_ladder_Upper()
