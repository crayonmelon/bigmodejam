extends HSlider

@export var bus_name = "Screams"

var bus_index=0

func _ready():
	
	value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index(bus_name)))
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_volume_changed)

func _on_volume_changed(value:float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

