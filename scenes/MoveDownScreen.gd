extends CollisionObject3D

@export var speed = 10
var close_point_given = false


func _ready():
	_mode_swap(GameManager.is_heaven)
	GameManager.Swap_Mode.connect(_mode_swap)

func _process(delta):
	
	global_position.z = position.z + speed * delta
	position.x = wrapf(position.x, GameManager.WORLD_BORDER_X_MIN, GameManager.WORLD_BORDER_X_MAX)
	
func _mode_swap(is_heaven):
	
	#2 = enemy
	#4 = coin
	
	if is_heaven:
		collision_layer = 4
		$Sprite3D.modulate = Color.GOLD
	else: 
		collision_layer = 2
		$Sprite3D.modulate = Color.BROWN

func _on_timer_timeout():
	$".".queue_free()

func _on_area_entered(area):
	if area.collision_layer == 8 :
		GameManager._change_charge_val(1)

		queue_free()
		area.queue_free()

	elif area.collision_layer == 16 && (not close_point_given) && (not GameManager.is_heaven):
		GameManager._change_charge_val(1)
		close_point_given = true
