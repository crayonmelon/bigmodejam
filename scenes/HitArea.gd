extends Area3D
@onready var animation_player = $"../ship_idle/AnimationPlayer" as AnimationPlayer
@onready var animation_tree = $"../ship_idle/AnimationPlayer/AnimationTree"
@onready var collision_shape_3d = $CollisionShape3D

func _on_area_entered(area):
	
	if area.collision_layer == 2:
		area.queue_free()	
		Hurt()

func Hurt():
	GameManager._chainge_health_val(-1)
	collision_shape_3d.disabled = true
	animation_tree.active = false
	animation_player.play("hurt")
	
	await animation_player.animation_finished
	
	collision_shape_3d.disabled = false
	animation_tree.active = true


