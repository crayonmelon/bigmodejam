extends AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.Health_Updated.connect(_die)
	finished.connect(_death_menu)


func _die():
	if GameManager.health == -1:
		play(0)
	
	
func _death_menu():
	GameManager.player_dead.emit()
	get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
