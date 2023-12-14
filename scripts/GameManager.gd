extends Node3D

signal Swap_Mode

signal Score_Updated
signal Health_Updated
signal Charge_Updated
signal Trans_Complete
signal player_dead
signal game_paused
signal near_miss
signal enemy_killed

var max_health = 3
var health = max_health

var score = 0 
const KILL_VALUE = 500
const NEAR_MISS_VALUE = 100

var max_charge = 300
var charge = 100000

const WORLD_BORDER_X_MIN = -14
const WORLD_BORDER_X_MAX = 14

const WORLD_BORDER_Z_MIN = 16
const WORLD_BORDER_Z_MAX = 52

const WORLD_BORDER_Y_MIN = -6
const WORLD_BORDER_Y_MAX = 30

const WORLD_HEIGHT = 10

var is_3D_mode = false
var invincible = false

func _process(delta):
	if is_3D_mode:
		_Charge_count_down()

func _input(event):
	if event.is_action_pressed("SWAP") and charge > 0:
		_swap_mode()

func _swap_mode(value = null):
	
	if value != null:
		is_3D_mode = value
		Swap_Mode.emit(is_3D_mode)
		return
		
	is_3D_mode = !is_3D_mode
	Swap_Mode.emit(is_3D_mode)

func _change_score_val(value):
	score += value
	#Score_Updated.emit()

func _change_health_val(value):
	health += value
	Health_Updated.emit()

func _set_health(value):
	health = value
	Health_Updated.emit()

func _set_score(value):
	score = value
	Score_Updated.emit()

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

var near_miss_val = 0
var near_miss_max = 10


func _change_near_miss(value):
	print("va")
	near_miss_val += value
	
	if near_miss_val >= near_miss_max:
		near_miss_val = 0
		_change_health_val(1)
	
	
func _reset_game():
	_set_health(3)
	_set_score(0)
	_swap_mode(false)
