extends ColorRect


func _ready():
	_update_bar()
	GameManager.Charge_Updated.connect(_update_bar)
	pass

func _update_bar():
	print(float(GameManager.charge)/float(GameManager.max_charge))
	anchor_right = float(GameManager.charge)/float(GameManager.max_charge)
