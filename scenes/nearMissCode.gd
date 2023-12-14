extends Label

func _ready():
	GameManager.near_miss.connect(_update_text)

func _update_text():
	text = str(GameManager.near_miss_val)
