extends TextureRect

func _ready():
	update_effect()
	GameManager.Health_Updated.connect(update_effect)

func update_effect():
	material.set("shader_parameter/target_color_depth", GameManager.health + 1)
