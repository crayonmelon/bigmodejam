extends MenuButton


# Called when the node enters the scene tree for the first time.
func _ready():
	get_popup().id_pressed.connect(toggle_item_checked)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func toggle_item_checked(index):
	get_popup().set_item_checked(index, get_popup().is_item_checked(index))
	
