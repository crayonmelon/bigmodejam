extends HBoxContainer

@onready var retry_button = $"Retry Button"
@onready var quit_button = $"Quit Button"

# Called when the node enters the scene tree for the first time.
func _ready():
	retry_button.button_down.connect(retry)
	quit_button.button_down.connect(quit)
	pass # Replace with function body.


func retry():
	GameManager._reset_game()
	get_tree().change_scene_to_file("res://scenes/Main_Game.tscn")
	
func quit():
	GameManager._reset_game()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
