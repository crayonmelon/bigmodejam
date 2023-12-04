extends Node3D

signal Swap_Mode

signal Coin_Updated
signal Health_Updated
signal Charge_Updated

var max_health = 3
var health = max_health
var coin = 0 

var max_charge = 300
var charge = 100000

const WORLD_BORDER_X_MIN = -14
const WORLD_BORDER_X_MAX = 14
const WORLD_BORDER_Z_MIN = 4
const WORLD_BORDER_Z_MAX = 50

const WORLD_HEIGHT = 21

var is_heaven = false

func _process(delta):
	if is_heaven:
		_Charge_count_down()

func _input(event):
	if event.is_action_pressed("SWAP") and charge > 0:
		_swap_mode()

func _swap_mode(value = null):
	
	if value != null:
		is_heaven = value
		Swap_Mode.emit(is_heaven)
		return
		
	is_heaven = !is_heaven
	Swap_Mode.emit(is_heaven)

func _chainge_coin_val(value):
	coin += value
	Coin_Updated.emit()

func _chainge_health_val(value):
	health += value
	Health_Updated.emit()
	if health <= 0:
		_died()

func _set_health(value):
	health = value
	Health_Updated.emit()

func _set_coin(value):
	coin = value
	Coin_Updated.emit()

func _change_charge_val(value):
	charge += value
	Charge_Updated.emit()
	if charge <= 0:
		_swap_mode(false)

func _set_charge(value):
	charge = value
	Charge_Updated.emit()	
	
@onready var timer = $Timer

func _Charge_count_down():
	
	if timer.is_stopped():
		_change_charge_val(-1)
		$Timer.start()

func _died():
#	get_tree().quit() 
	pass
