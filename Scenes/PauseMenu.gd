extends Node2D
# Script is designed to be placed in the world node, and needs a reference to the player camera
@onready var pause_menu: Control = $"../PauseMenu"



#$Player/Camera2D/PauseMenu
var paused = false


func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		get_tree().paused = false
	else:
		pause_menu.show()
		get_tree().paused = true
		
	paused = !paused
