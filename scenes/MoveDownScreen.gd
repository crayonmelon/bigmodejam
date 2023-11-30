extends CollisionObject3D

const speed = 10

func _ready():
	_mode_swap(GameManager.is_heaven)
	GameManager.Swap_Mode.connect(_mode_swap)

func _process(delta):
	
	global_position.z = global_position.z + speed * delta
	pass

func _mode_swap(is_heaven):
	
	if is_heaven:
		collision_layer = 2
		$Sprite3D.modulate = Color.BROWN
	else: 
		collision_layer = 4
		$Sprite3D.modulate = Color.GOLD
