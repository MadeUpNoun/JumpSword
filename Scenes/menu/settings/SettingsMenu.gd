extends Control
class_name SettingsMenu

@onready var exit_button: Button = $MarginContainer/VBoxContainer/ExitButton as Button

signal exit_settings_menu

func _ready():
	set_process(false)


func _on_exit_button_pressed() -> void:
	exit_settings_menu.emit()
	SettingsSignalBus.emit_set_settings_dictionary(SettingsDataContainer.create_storage_dictionary())
	set_process(false)
