extends Control

@onready var retry_button = $"VBoxContainer/HBoxContainer/Retry Button"
@onready var quit_button = $"VBoxContainer/HBoxContainer/Quit Button"
@onready var score_label = $"VBoxContainer/Score Label"

# Called when the node enters the scene tree for the first time.
func _ready():
	retry_button.button_down.connect(retry)
	quit_button.button_down.connect(quit)
	score_label.text = str(int(GameManager.score)) + " souls saved"


func retry():
	GameManager._reset_game()
	get_tree().change_scene_to_file("res://scenes/Main_Game.tscn")
	
func quit():
	GameManager._reset_game()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
