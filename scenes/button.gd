extends Button

func _ready():
	grab_focus()
	GameManager.game_paused.connect(toggle_focus)

func toggle_focus():
	grab_focus()
