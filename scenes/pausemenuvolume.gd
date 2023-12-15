extends Button

@onready var volume = $"../../../Volume"

func _on_pressed():
	volume.visible = true
