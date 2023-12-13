extends MeshInstance3D

@onready var billboards = [
	preload("res://sprites/Billboard/billboard1.png"), 
preload("res://sprites/Billboard/billboard2.png"), 
preload("res://sprites/Billboard/billboard3.png"), 
preload("res://sprites/Billboard/billboard4.png"), 
preload("res://sprites/Billboard/billboard5.png"),
preload("res://sprites/Billboard/billboard6.png"), 
preload("res://sprites/Billboard/billboard7.png")]

func _ready():
	
	mesh.surface_get_material(0).set("albedo_texture", billboards.pick_random())
	
