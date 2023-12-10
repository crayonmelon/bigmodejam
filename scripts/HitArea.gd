extends Area3D
@onready var animation_player = $"../ship_idle/AnimationPlayer" as AnimationPlayer
@onready var animation_tree = $"../ship_idle/AnimationPlayer/AnimationTree"
@onready var collision_shape_3d = $CollisionShape3D


func _on_area_entered(area):
	
	if area.collision_layer == 2 and !GameManager.invincible:
		area.queue_free()	
		Hurt()

func Hurt():
	
	GameManager.invincible = true
	GameManager._chainge_health_val(-1)
	collision_layer = 0
	animation_tree.active = false
	animation_player.play("hurt")
	
	await animation_player.animation_finished
	
	GameManager.invincible = false
	print("wait?")
	collision_layer = 1

	animation_tree.active = true
