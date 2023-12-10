extends Resource
class_name Enemy_Resource

@export var cost = 1
@export var level = 0
@export var prefab: PackedScene


#X max size = -14, 14
#Y max size = -6, 30

@export var x_range: Vector2 = Vector2(-14, 14)
@export var y_range: Vector2

func _rand_location():
	var _rand_location = Vector3(
		randi_range(x_range.x,x_range.y),
		randi_range(y_range.x,y_range.y), 
		0)
	return _rand_location() as Vector3
