extends Node3D

var explosion = ["Explosion_0", "Explosion_1", "Explosion_2", "Explosion_3"]

func _ready():
	$AnimatedSprite3D.play(explosion.pick_random())
	await $AnimatedSprite3D.animation_finished
	queue_free()
