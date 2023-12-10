extends TextureRect

func _ready():
	update_effect()
	GameManager.Health_Updated.connect(update_effect)

func update_effect():
	print("soing the do")
	material.set("shader_parameter/target_color_depth", GameManager.health + 1)
