extends Node3D

@export var vol_distance = 5
var audio_source = [preload("res://Audio/crushedAudio/bangbang.ogg"), preload("res://Audio/crushedAudio/getbackhere.ogg"), preload("res://Audio/crushedAudio/goininternational.ogg"), preload("res://Audio/crushedAudio/heyyou.ogg"), preload("res://Audio/crushedAudio/I_mofftheclock.ogg"), preload("res://Audio/crushedAudio/skelifugedaboutit.ogg"), preload("res://Audio/crushedAudio/skeligetbackhere.ogg"), preload("res://Audio/crushedAudio/skelihey2.ogg"), preload("res://Audio/crushedAudio/skelilemmegowithya.ogg"), preload("res://Audio/crushedAudio/skeliweregonagetcha.ogg"), preload("res://Audio/crushedAudio/skeliwhereyougoing.ogg"), preload("res://Audio/crushedAudio/skeliwhereyougoingcomeback.ogg"), preload("res://Audio/crushedAudio/skellihey1.ogg"), preload("res://Audio/crushedAudio/violnec.ogg"), preload("res://Audio/crushedAudio/weregonnafuckyou(up).ogg"), preload("res://Audio/crushedAudio/weregonnagetcha.ogg"), preload("res://Audio/crushedAudio/weregonnaOSHAviolateya.ogg")]

func _ready():

	_scream() 

func _scream():
	$AudioStreamPlayer3D.stream = audio_source.pick_random()
	$AudioStreamPlayer3D.play()
	
	await $AudioStreamPlayer3D.finished
	
	_scream()
