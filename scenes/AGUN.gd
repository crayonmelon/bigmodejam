extends Node3D

var bullet = preload("res://scenes/bullet.tscn")
@onready var shoot_delay = $ShootDelay as Timer

func _shoot():
	
	GameManager._chainge_coin_val(-1)
	
	var obj = bullet.instantiate()

	get_tree().root.add_child(obj)

	obj.global_position = global_position
	obj.global_position.y = 21

func _process(delta):

	if Input.is_action_pressed("SHOOT")  && (not GameManager.is_3D_mode) && GameManager.coin > 0 && shoot_delay.is_stopped():
		shoot_delay.start(.1)
		_shoot()
