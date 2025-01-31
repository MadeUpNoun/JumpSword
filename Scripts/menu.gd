extends Control

@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var settings_menu: SettingsMenu = $settings_menu
@onready var anim = $AnimationPlayer
@onready var logo = $Logo

func _physics_process(_delta: float) -> void:
	anim.play("falling")
	await anim.animation_finished
func _on_play_pressed():
	# Change To Game Scene When Created
		get_tree().change_scene_to_file("res://main_map.tscn")
	# Change When Settings implemented

func _on_quit_pressed():
	get_tree().quit()


func _on_settings_pressed() -> void:
	v_box_container.visible = false
	settings_menu.visible = true
	settings_menu.set_process(true)
	logo.hide()


func _on_settings_menu_exit_settings_menu() -> void:
	v_box_container.visible = true
	settings_menu.visible = false
	logo.show()
	
 
