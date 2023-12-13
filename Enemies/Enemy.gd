extends Area3D

@export var health = 20
@export var speed = 10

@export var move_z = true

@export var move_x = false
@export var speed_x = -10


func _ready():
	GameManager.Swap_Mode.connect(_mode_swap)
	
	await get_tree().create_timer(.1).timeout
	
	_mode_swap(GameManager.is_3D_mode)
	
func _process(delta):
	if move_z:
		global_position.z = position.z + speed * delta
		
	if move_x:
		global_position.x = position.x + speed_x * delta
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
	GameManager.enemy_killed.emit()
	queue_free()

func _mode_swap(is_3D_mode):
	if is_3D_mode:
		$CollisionShape3D.position.y = 0
	else: 
		$CollisionShape3D.global_position.y = GameManager.WORLD_HEIGHT
