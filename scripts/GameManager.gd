extends Node3D

signal Swap_Mode

const WORLD_BORDER_X_MIN = -14
const WORLD_BORDER_X_MAX = 14
const WORLD_BORDER_Z_MIN = 4
const WORLD_BORDER_Z_MAX = 50

const WORLD_HEIGHT = 21

var is_heaven = false

func _input(event):
	if event.is_action_pressed("SWAP"):
		is_heaven = !is_heaven
			
		Swap_Mode.emit(is_heaven)
