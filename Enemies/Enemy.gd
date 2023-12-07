extends Area3D

@export var health = 30
@export var speed = 10

func _process(delta):
	
	global_position.z = position.z + speed * delta
	#position.x = wrapf(position.x, GameManager.WORLD_BORDER_X_MIN, GameManager.WORLD_BORDER_X_MAX)

func _on_death_timer_timeout():
	queue_free()
