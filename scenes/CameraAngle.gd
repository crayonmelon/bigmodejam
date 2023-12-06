extends Camera3D


func _ready():
	GameManager.Swap_Mode.connect(Change_Angle)
	pass 

func Change_Angle(is_3D_mode):
	if is_3D_mode:
		$AnimationPlayer.play("ChangeAngle")
	else:
		$AnimationPlayer.play_backwards("ChangeAngle")
