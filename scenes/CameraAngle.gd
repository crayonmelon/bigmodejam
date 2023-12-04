extends Camera3D


func _ready():
	GameManager.Swap_Mode.connect(Change_Angle)
	pass 

func Change_Angle(is_heaven):
	if is_heaven:
		$AnimationPlayer.play("ChangeAngle")
	else:
		$AnimationPlayer.play_backwards("ChangeAngle")
