extends HBoxContainer

@onready var continue_button = $"Continue Button"
@onready var quit_button = $"Quit Button"
@onready var background_panel = $"../.."

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		_pause()

func _ready():
	continue_button.connect("button_down", _resume)
	quit_button.connect("button_down", _quit)
	
func _pause():
	if get_tree().paused:
		_resume()
	else:
		print(background_panel.name)
		background_panel.visible = true
		get_tree().paused = true
		GameManager.game_paused.emit(true)

func _quit():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _resume():
	background_panel.visible = false
	get_tree().paused = false
	GameManager.game_paused.emit(false)
