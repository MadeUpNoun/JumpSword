extends Control


@onready var audio_name_label: Label = $HBoxContainer/AudioNameLabel
@onready var audio_num_label: Label = $HBoxContainer/AudioNumLabel
@onready var h_slider: HSlider = $HBoxContainer/HSlider

@export_enum("Master", "Music", "Sfx") var bus_name : String

var bus_index: int = 0

func _ready():
	get_bus_name_by_index()
	load_data()
	set_name_label_text()
	set_slider_value()
	
func load_data():
	match bus_name:
		"Master":
			on_value_changed(SettingsDataContainer.get_master_volume())
		"Music":
			on_value_changed(SettingsDataContainer.get_music_volume())
		"Sfx":
			on_value_changed(SettingsDataContainer.get_sfx_volume())

func set_name_label_text():
	audio_name_label.text = str(bus_name) + " volume"

func set_audio_num_label_text():
	audio_num_label.text = str(h_slider.value * 100)

func get_bus_name_by_index():
	bus_index = AudioServer.get_bus_index(bus_name)


func set_slider_value():
	h_slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	set_audio_num_label_text()

func on_value_changed(value: float):
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	set_audio_num_label_text()
	
	match bus_index:
		0:
			SettingsSignalBus.emit_master_sound_set(value)
		1: 
			SettingsSignalBus.emit_music_sound_set(value)
		2: 
			SettingsSignalBus.emit_sfx_sound_set(value)
