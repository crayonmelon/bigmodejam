extends Area3D
@onready var animation_player = $"../ship_idle/AnimationPlayer" as AnimationPlayer
@onready var animation_tree = $"../ship_idle/AnimationPlayer/AnimationTree"
@onready var collision_shape_3d = $CollisionShape3D
@onready var hit_area_audio_stream_player = $"HitArea AudioStreamPlayer"

var explo = preload("res://scenes/Explosion.tscn")

func _on_area_entered(area):
	
	if area.collision_layer == 2 and !GameManager.invincible:
		area.queue_free()	
		Hurt()

func Hurt():
	
	GameManager.invincible = true
	GameManager._change_health_val(-1)
	collision_layer = 0
	animation_tree.active = false
	animation_player.play("hurt")
	
	hit_area_audio_stream_player.play(0)
	
	var explode = explo.instantiate()
	explode.position = global_position
	explode.rotation = global_rotation	
	get_tree().root.add_child(explode)
	
	await animation_player.animation_finished
	
	GameManager.invincible = false
	
	collision_layer = 1
	animation_tree.active = true
	

