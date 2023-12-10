extends Area3D

@export var health = 20
@export var speed = 10

func _ready():
	_mode_swap(GameManager.is_3D_mode)
	GameManager.Swap_Mode.connect(_mode_swap)

func _process(delta):
	
	global_position.z = position.z + speed * delta
	#position.x = wrapf(position.x, GameManager.WORLD_BORDER_X_MIN, GameManager.WORLD_BORDER_X_MAX)

func _on_death_timer_timeout():
	queue_free()

func _on_area_entered(area):
	_hurt()

func _hurt():
	$AnimationPlayer.play("Hurt")
	health -= 1 
	if health <= 0:
		_die()
		
func _die():
	queue_free()

func _mode_swap(is_3D_mode):
	if is_3D_mode:
		$CollisionShape3D.position.y = 0
	else: 
		$CollisionShape3D.global_position.y = GameManager.WORLD_HEIGHT
