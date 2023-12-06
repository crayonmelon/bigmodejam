extends MeshInstance3D

@export var scrollDirection: Vector3 = Vector3(1, 0, 0)
@export var scrollSpeed: float = 5

@export var texture_heaven = preload("res://sprites/Citymap001.png")
@export var texture_hell = preload("res://sprites/Cloud_layer_001.png")

func _ready():
	_change_sprite(GameManager.is_3D_mode)
	GameManager.Swap_Mode.connect(_change_sprite)

func _process(delta):
	get_surface_override_material(0).uv1_offset += scrollDirection * scrollSpeed * delta

func _change_sprite(is_3D_mode):
	pass
	get_surface_override_material(0).albedo_texture = texture_heaven if is_3D_mode else texture_hell
