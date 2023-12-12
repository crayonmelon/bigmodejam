extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.player_dead.connect(stop)
	GameManager.game_paused.connect(_lower_music)


func _lower_music(isPaused):
	set_bus("Low_Pass" if isPaused else "Master")
