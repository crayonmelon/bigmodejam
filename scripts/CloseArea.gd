extends Area3D
@onready var sprite_3d = $Sprite3D
@onready var near_hit_area_audio_stream_player = $"NearHitArea AudioStreamPlayer"

func _on_area_entered(area):
	GameManager._change_near_miss(1)
	GameManager.near_miss.emit()
	
	$AnimationPlayer.play("fade_in")
	near_hit_area_audio_stream_player.play(0)
