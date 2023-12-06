extends CollisionObject3D

@export var speed = 10
var close_point_given = false
@onready var collision_shape_3d = $CollisionShape3D
var y_original  

func _ready():
	
	y_original = collision_shape_3d.global_position.y
		
	_mode_swap(GameManager.is_3D_mode)
	GameManager.Swap_Mode.connect(_mode_swap)

func _process(delta):
	
	global_position.z = position.z + speed * delta
	position.x = wrapf(position.x, GameManager.WORLD_BORDER_X_MIN, GameManager.WORLD_BORDER_X_MAX)
	
func _mode_swap(is_3D_mode):
	if is_3D_mode:
		collision_shape_3d.position.y = 0
	else: 
		collision_shape_3d.global_position.y = GameManager.WORLD_HEIGHT
		

func _on_timer_timeout():
	$".".queue_free()

func _on_area_entered(area):
	if area.collision_layer == 8 :
		GameManager._change_charge_val(1)

		queue_free()
		area.queue_free()

	elif area.collision_layer == 16 && (not close_point_given):
		GameManager._change_charge_val(1)
		close_point_given = true
