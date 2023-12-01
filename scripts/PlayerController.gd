extends CharacterBody3D

const SPEED = 10
const HEAVEN_SPEED = 30

@onready var ship_model = $ship_idle/plane_2


func _ready():
	_mode_Swap(GameManager.is_heaven)
	GameManager.Swap_Mode.connect(_mode_Swap)

func _physics_process(delta):
	if GameManager.is_heaven:
		heaven_control(delta)
	else:
		hell_control(delta)

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
	
	move_and_slide()

func _input(event):
	
	if event.is_action_pressed("SHOOT") && GameManager.is_heaven:
		print("is_heaven")
		direction_hell = direction_hell*-1
