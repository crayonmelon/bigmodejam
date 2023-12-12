extends Node3D

@export var speed = 10

func _process(delta):
	global_position.x = position.x - speed * delta
	global_position.z = position.z + speed * delta
	
