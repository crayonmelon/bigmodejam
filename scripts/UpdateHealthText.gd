extends Label

func _ready():
	update_text()
	GameManager.Health_Updated.connect(update_text)

func update_text():
	text = str(GameManager.health)
