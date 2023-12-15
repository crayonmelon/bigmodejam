extends Area3D

@export var health = 20
@export var speed = 10

@export var move_z = true

@export var move_x = false
@export var speed_x = -10

var collider_3d_origin

var explo = preload("res://scenes/Explosion.tscn")

func _ready():
	collider_3d_origin = $CollisionShape3D.position.y
	
	if $AnimationPlayer.get_animation("drop_in") != null:
		$AnimationPlayer.play("drop_in")
		await $AnimationPlayer.animation_finished
	
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
	
	var explode = explo.instantiate()
	explode.position = global_position
	explode.rotation = global_rotation	
	get_tree().root.add_child(explode)
	queue_free()

func _mode_swap(is_3D_mode):
	if is_3D_mode:
		$CollisionShape3D.position.y = collider_3d_origin
	else: 
		$CollisionShape3D.global_position.y = GameManager.WORLD_HEIGHT
