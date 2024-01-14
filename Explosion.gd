extends Node3D

var explosion_sound = [preload("res://Audio/Sound Effects/enemy_die_1.wav"), 
preload("res://Audio/Sound Effects/enemy_die_2.wav"), 
preload("res://Audio/Sound Effects/enemy_die_3.wav")]
var explosion = ["Explosion_0", "Explosion_1", "Explosion_2", "Explosion_3"]

func _ready():
	$AnimatedSprite3D.play(explosion.pick_random())
	$AudioStreamPlayer3D.stream = explosion_sound.pick_random()
	$AudioStreamPlayer3D.play()
	await $AnimatedSprite3D.animation_finished
	queue_free()
