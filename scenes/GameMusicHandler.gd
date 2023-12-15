extends AudioStreamPlayer

func _ready():
	GameManager.player_dead.connect(stop)
	GameManager.game_paused.connect(_lower_music)

func _lower_music(isPaused):
	
	var effect = AudioEffectLowPassFilter
	AudioServer.set_bus_effect_enabled(AudioServer.get_bus_index("Master"), 0, isPaused)
