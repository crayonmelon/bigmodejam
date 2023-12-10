extends MeshInstance3D

@export var scrollDirection: Vector3 = Vector3(1, 0, 0)
@export var scrollSpeed: float = 5

func _process(delta):
	get_surface_override_material(0).uv1_offset += scrollDirection * scrollSpeed * delta
