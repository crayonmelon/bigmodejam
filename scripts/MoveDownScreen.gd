extends CollisionObject3D

@export var speed = 20
var close_point_given = false
@onready var collision_shape_3d = $CollisionShape3D
var y_original  

func _ready():
	
	y_original = collision_shape_3d.global_position.y
	
	if GameManager.is_3D_mode:
		var player_pos = get_tree().get_nodes_in_group("Player")[0].position
		look_at(player_pos)
	
	GameManager.Swap_Mode.connect(_mode_swap)
	GameManager.player_dead.connect(_destroy)
	
	await get_tree().create_timer(.1).timeout
	
	_mode_swap(GameManager.is_3D_mode)


func _process(delta):
	

	#position.x = wrapf(position.x, GameManager.WORLD_BORDER_X_MIN, GameManager.WORLD_BORDER_X_MAX)
	if GameManager.is_3D_mode:
		global_transform.origin -= transform.basis.z.normalized() * speed * delta
	else: 
		translate(transform.basis.z.normalized() * speed * delta)
	
func _mode_swap(is_3D_mode):
	if is_3D_mode:
		collision_shape_3d.position.y = 0
	
	else: 
		collision_shape_3d.global_position.y = GameManager.WORLD_HEIGHT
		print(collision_shape_3d.global_position)		
		
func _on_timer_timeout():
	$".".queue_free()

func _on_area_entered(area):
	queue_free()
	area.queue_free()

func _destroy():
	queue_free()
