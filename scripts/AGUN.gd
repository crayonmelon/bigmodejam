extends Node3D

var bullet = preload("res://scenes/bullet.tscn")

@onready var agun_audio_stream_player = $"AGUN AudioStreamPlayer"

@onready var shoot_delay = $ShootDelay as Timer

func _shoot():
	var obj = bullet.instantiate()

	get_tree().root.add_child(obj)

	obj.global_position = global_position

func _process(delta):
	
	if Input.is_action_pressed("SHOOT") && shoot_delay.is_stopped():
		shoot_delay.start(.1)
		agun_audio_stream_player.play(0)
		_shoot()
