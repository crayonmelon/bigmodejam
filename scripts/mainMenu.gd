extends VBoxContainer

@onready var play_button = $"Play Button" as Button
@onready var settings_button = $"Settings Button" as Button
@onready var quit_button = $"Quit Button" as Button

# Called when the node enters the scene tree for the first time.
func _ready():
	play_button.connect("pressed", playGame)
	quit_button.connect("pressed", quitGame)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func playGame():
	get_tree().change_scene_to_file("res://scenes/Main_Game.tscn")

func quitGame():
	get_tree().quit()
