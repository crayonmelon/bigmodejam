extends Node3D

@export var spin = Vector3(1,0,0)

func _process(delta):
	
	rotate_x(spin.x * delta)
	rotate_y(spin.y * delta)
	rotate_z(spin.z * delta)
