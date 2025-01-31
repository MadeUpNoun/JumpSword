extends Control

@onready var main: Node2D = $"../Node2D"




func _on_resume_pressed() -> void:
	main.pauseMenu()
	



func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/menu/menu.tscn")
