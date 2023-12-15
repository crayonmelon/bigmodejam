extends CharacterBody3D

const SPEED = 20
const HEAVEN_SPEED = 20
const SLOW_SPEED = 7

var SLOWED = false

@onready var ship_model = $ship_idle/plane_2
@onready var animation_tree = $ship_idle/AnimationPlayer/AnimationTree
@export var blend_animations: bool = false

var _3d_vec_pos = Vector3(0,10,32)

func _ready():
	_mode_Swap(GameManager.is_3D_mode)
	GameManager.Trans_Complete.connect(_trans_complete)
	
	GameManager.Swap_Mode.connect(_mode_Swap)
	$ship_idle/AnimationPlayer/AnimationTree.active = true

func _physics_process(delta):
	
	var input_dir = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")		
	var direction = (Vector2(input_dir.x, input_dir.y)).normalized()
	if GameManager.is_3D_mode:
		heaven_control(delta, direction)
	else:
		hell_control(delta, direction)
	
	if blend_animations:
		animation_tree.set("parameters/blend_position", lerp(animation_tree.get("parameters/blend_position"), input_dir, 10 * delta))
	else:
		animation_tree.set("parameters/blend_position", input_dir)
		
	move_and_slide()

func _process(delta):
	
	if Input.is_action_pressed("SLOW"):
		SLOWED = true
	else: 
		SLOWED = false
	
	position.x = max(position.x, GameManager.WORLD_BORDER_X_MIN)
	position.x = min(position.x, GameManager.WORLD_BORDER_X_MAX)
	
	position.z = max(position.z, GameManager.WORLD_BORDER_Z_MIN)
	position.z = min(position.z, GameManager.WORLD_BORDER_Z_MAX)
	
	position.y = max(position.y, GameManager.WORLD_BORDER_Y_MIN)
	position.y = min(position.y, GameManager.WORLD_BORDER_Y_MAX)


func heaven_control(delta, direction): 

	if direction:
		velocity.x = direction.x * (SPEED if not SLOWED else SLOW_SPEED)
		velocity.y = -direction.y * (SPEED if not SLOWED else SLOW_SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, (SPEED if not SLOWED else SLOW_SPEED))
		velocity.y = move_toward(-velocity.y, 0, (SPEED if not SLOWED else SLOW_SPEED))

func hell_control(delta, direction):

	if direction:
		velocity.x = direction.x * (SPEED if not SLOWED else SLOW_SPEED)
		velocity.z = direction.y * (SPEED if not SLOWED else SLOW_SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, (SPEED if not SLOWED else SLOW_SPEED))
		velocity.z = move_toward(velocity.y, 0, (SPEED if not SLOWED else SLOW_SPEED))

func _mode_Swap(is_3D_mode):
	
	velocity = Vector3.ZERO
	if !is_3D_mode:
		position = Vector3(position.x,_3d_vec_pos.y, 46)

func _trans_complete():
	if GameManager.is_3D_mode:
		position = Vector3(position.x,position.y, _3d_vec_pos.z)
	pass
