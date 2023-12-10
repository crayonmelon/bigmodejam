extends Label

func _ready():
	update_text()
	GameManager.Coin_Updated.connect(update_text)

func update_text():
	text = str(GameManager.coin)
