extends CharacterBody3D

const SPEED = 10
const HEAVEN_SPEED = 30

@onready var ship_model = $ship_idle/plane_2
@onready var animation_tree = $ship_idle/AnimationPlayer/AnimationTree

@export var blend_animations: bool = false

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
	
	print(position.x)
	
	if GameManager.is_heaven:
		if position.x == GameManager.WORLD_BORDER_X_MIN:
			change_direction(true)
		
		elif position.x == GameManager.WORLD_BORDER_X_MAX:
			change_direction(false)

func _mode_Swap(is_heaven):
	if is_heaven:
		$AnimationPlayer.play("shrink")
	else: 
		$AnimationPlayer.play_backwards("shrink")
		
var direction_hell = Vector3(1, 0, 0)

func heaven_control(delta): 
	
	velocity.x = direction_hell.x * HEAVEN_SPEED
	velocity.z = 0
	move_and_slide()
	
	ship_model.rotation.x = lerp(ship_model.rotation.x, direction_hell.x, 10 * delta)
	
	if blend_animations:
		animation_tree.set("parameters/blend_position", lerp(animation_tree.get("parameters/blend_position"), direction_hell, 10 * delta))
	else:
		animation_tree.set("parameters/blend_position", direction_hell)
	
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
	

func _input(event):
	
	if event.is_action_pressed("SHOOT") && GameManager.is_heaven:
		print("is_heaven")
		direction_hell = direction_hell*-1

func change_direction(left):
	print("wuhay")
	direction_hell = Vector3(1, 0, 0) if left else Vector3(-1, 0, 0)
