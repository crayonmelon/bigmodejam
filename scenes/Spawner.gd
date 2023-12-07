extends Node3D

@export var enemies : Array[Enemy_Resource] = [preload("res://Enemies/Ladder_Skeleton.tres")]
func _ready():
	_spawn_enemy()

func _spawn_enemy():
	var enemy = enemies.pick_random().prefab.instantiate()
	
	get_tree().root.add_child(enemy)
	enemy.global_position = global_position
	enemy.global_position.x = randi_range(enemies.pick_random().x_range.x, enemies.pick_random().x_range.y)
	enemy.global_position.y = randi_range(enemies.pick_random().y_range.x, enemies.pick_random().y_range.y)

func _on_timer_timeout():
	_spawn_enemy()
	position.x = wrapf(position.x, GameManager.WORLD_BORDER_X_MIN, GameManager.WORLD_BORDER_X_MAX)
