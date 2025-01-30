extends Control

@onready var option_button: OptionButton = $HBoxContainer/OptionButton

const RESOLUTION_DICTIONARY : Dictionary = {
	"1152 x 648" : Vector2i(1152,648),
	"1280 x 720" : Vector2i(1280,720),
	"1920 x 1080" : Vector2i(1920,1080),
	"1600 x 900" : Vector2i(1600,900),
	"2560 x 1440" : Vector2i(2560,1440)
	
	
}
func _ready():
	add_resolution_items()
	load_data()
	
func load_data():
	_on_resolution_selected(SettingsDataContainer.get_resolution_index())
	option_button.select(SettingsDataContainer.get_resolution_index())

func add_resolution_items():
	for resolution_text_size_string in RESOLUTION_DICTIONARY:
		option_button.add_item(resolution_text_size_string)

func _on_resolution_selected(index: int):
	SettingsSignalBus.emit_on_resolution_selected(index)
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])
