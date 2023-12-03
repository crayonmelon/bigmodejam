extends Node3D

signal Swap_Mode

signal Coin_Updated
signal Health_Updated

var max_health = 3
var health = max_health
var coin = 0 

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
	
func _chainge_coin_val(value):
	coin += value
	Coin_Updated.emit()

func _chainge_health_val(value):
	health += value
	Health_Updated.emit()

func _set_health(value):
	health = value
	Health_Updated.emit()	

func _set_coin(value):
	coin = value
	Coin_Updated.emit()	
