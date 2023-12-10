extends Panel

@onready var health_bar_sprites = preload("res://sprites/Player_Health_Sprites.png")
@onready var styleBox = StyleBoxTexture.new()

func _ready():
	styleBox.texture = health_bar_sprites
	update_bar()
	GameManager.Health_Updated.connect(update_bar)

func update_bar():
	var region_rect = Rect2(0, (GameManager.max_health - GameManager.health) * 64, 64, 64)
	styleBox.region_rect = region_rect
	set("theme_override_styles/panel", styleBox)
