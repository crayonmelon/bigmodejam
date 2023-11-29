extends Node3D

signal Swap_Mode

var is_heaven = false

func _input(event):
	if event.is_action_pressed("SWAP"):
		is_heaven = !is_heaven
			
		Swap_Mode.emit(is_heaven)
