extends Node3D

@onready var level_up_timer = $LevelUpTimer

@export var enemies : Array[Enemy_Resource] = [
	preload("res://Enemies/Enemy_Skull_Forward.tres"), 
	preload("res://Enemies/Ladder_Skeleton.tres"), 
	preload("res://Enemies/enemy_skull_spin.tres"), 
	preload("res://Enemies/Wall.tres"),
	preload("res://Enemies/building.tres"),
	preload("res://Enemies/Sign.tres"),
	preload("res://Enemies/blimp.tres"),
	preload("res://Enemies/crane.tres")
	]
	
var budget = 3

func _ready():
	_spawn_enemy()

func _spawn_enemy():
	
	var to_spend = budget
	
	while to_spend >= 0:	
		
		await get_tree().create_timer(randf_range(0.0,1.0)).timeout
		
		var enemy = enemies.pick_random()
		
		if enemy.cost >= to_spend:
			continue
			
		var enemy_inst = enemy.prefab.instantiate()
		to_spend -= enemy.cost
		get_tree().root.get_node_or_null("Main_Game").add_child(enemy_inst)
		enemy_inst.global_position = global_position
		enemy_inst.global_position.x = randi_range(enemy.x_range.x, enemy.x_range.y)
		enemy_inst.global_position.y = randi_range(enemy.y_range.x, enemy.y_range.y)
		
func _on_timer_timeout():
	_spawn_enemy()

func _on_level_up_timer_timeout():
	budget = budget + 1
