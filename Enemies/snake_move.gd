extends Path3D

@export var speed = 15

@export var space = 3

func _ready():
	for i in get_child_count():
		get_child(i-1).progress +=  i * space

func _process(delta):
	for i in get_child_count():
		get_child(i-1).progress -= speed * delta
