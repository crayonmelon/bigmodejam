extends Control

func _on_continue_button_pressed():
	visible = false


func _on_visibility_changed():
	if visible == true:
		$"VBoxContainer/Continue Button".grab_focus()
