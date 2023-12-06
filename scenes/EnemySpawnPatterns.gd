extends Node3D

@export var start_on_ready = true
@export var Patterns = [preload("res://scenes/EnemySpawnPattern/enemy_path_2.tscn"), preload("res://scenes/EnemySpawnPattern/enemy_path.tscn")] 
@onready var spawn_pivot = $SpawnPivot

func _ready():
	if start_on_ready:
		Change_Pattern()
		Start_Pattern()

func Start_Pattern():
	$Timer.start()

func Stop_Pattern():
	$Timer.stop()
	if is_instance_valid(spawn_pivot.get_child(0)):
		spawn_pivot.remove_child(spawn_pivot.get_child(0))

func Change_Pattern():
	if is_instance_valid(spawn_pivot.get_child(0)):
		spawn_pivot.remove_child(spawn_pivot.get_child(0))

	var obj = Patterns.pick_random().instantiate()
	spawn_pivot.add_child(obj)
	
	obj.global_position = spawn_pivot.global_position

func _on_timer_timeout():
	Change_Pattern()
