extends Area3D
@onready var sprite_3d = $Sprite3D

func _on_area_entered(area):
	
	if area.collision_layer == 2:
		$AnimationPlayer.play("fade_in")
