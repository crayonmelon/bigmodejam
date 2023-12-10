extends Camera3D


func _ready():
	
	GameManager.Swap_Mode.connect(Change_Angle)

func Change_Angle(is_3D_mode):
	
	GameManager.invincible = true
	
	if is_3D_mode:
		$AnimationPlayer.play("ChangeAngle")
		
	else:
		$AnimationPlayer.play_backwards("ChangeAngle")

	await $AnimationPlayer.animation_finished
	GameManager.Trans_Complete.emit()
	GameManager.invincible = false
