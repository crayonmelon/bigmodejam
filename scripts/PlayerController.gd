extends CharacterBody3D

const SPEED = 10
const HEAVEN_SPEED = 20

@onready var ship_model = $ship_idle/plane_2
@onready var animation_tree = $ship_idle/AnimationPlayer/AnimationTree
@export var blend_animations: bool = false

var _3d_vec_pos = Vector3(0,10,32)


func _ready():
	_mode_Swap(GameManager.is_heaven)
	GameManager.Swap_Mode.connect(_mode_Swap)

func _physics_process(delta):
	if GameManager.is_heaven:
		heaven_control(delta)
	else:
		hell_control(delta)

func _process(delta):
	position.x = max(position.x, GameManager.WORLD_BORDER_X_MIN)
	position.x = min(position.x, GameManager.WORLD_BORDER_X_MAX)
	
	position.z = max(position.z, GameManager.WORLD_BORDER_Z_MIN)
	position.z = min(position.z, GameManager.WORLD_BORDER_Z_MAX)
	
	position.y = max(position.y, GameManager.WORLD_BORDER_Y_MIN)
	position.y = min(position.y, GameManager.WORLD_BORDER_Y_MAX)

func _mode_Swap(is_heaven):
	
	velocity = Vector3.ZERO
	position = Vector3(position.x,_3d_vec_pos.y, _3d_vec_pos.z)
	if is_heaven:
		$AnimationPlayer.play("shrink")
		
	else: 
		$AnimationPlayer.play_backwards("shrink")
		

func heaven_control(delta): 
	var input_dir = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
	var direction = (transform.basis * Vector3(input_dir.x, input_dir.y, 0)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	ship_model.rotation.x = lerp(ship_model.rotation.x, direction.y, 10 * delta)
	
	if blend_animations:
		animation_tree.set("parameters/blend_position", lerp(animation_tree.get("parameters/blend_position"), input_dir, 10 * delta))
	else:
		animation_tree.set("parameters/blend_position", input_dir)
	
	move_and_slide()
	
func hell_control(delta):
	var input_dir = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	ship_model.rotation.x = lerp(ship_model.rotation.x, direction.x, 10 * delta)
	
	if blend_animations:
		animation_tree.set("parameters/blend_position", lerp(animation_tree.get("parameters/blend_position"), input_dir, 10 * delta))
	else:
		animation_tree.set("parameters/blend_position", input_dir)
	
	move_and_slide()
