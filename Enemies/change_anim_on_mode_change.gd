extends Node

func _ready():
	_mode_swap(GameManager.is_3D_mode)
	GameManager.Swap_Mode.connect(_mode_swap)

func _mode_swap(is_3D_mode):
	
	if is_3D_mode:
		$AnimationPlayer.play("mode_3d")
	else:
		$AnimationPlayer.play_backwards("mode_3d")
		
