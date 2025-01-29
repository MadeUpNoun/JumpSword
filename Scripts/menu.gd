extends Control


func _on_play_pressed():
	# Change To Game Scene When Created
	get_tree().change_scene_to_file("res://main_map.tscn")
	# Change When Settings implemented

func _on_quit_pressed():
	get_tree().quit()

func _on_settings_pressed() -> void:
	pass # Replace with function body.
