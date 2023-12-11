extends RayCast3D

@onready var shadow = $Shadow

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
	var point = get_collision_point()
	if point:
		shadow.global_position.y = point.y

	shadow.visible = GameManager.is_3D_mode
