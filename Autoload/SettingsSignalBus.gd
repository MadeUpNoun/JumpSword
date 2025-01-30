extends Node

# Graphics Signals
signal on_window_mode_selected(index : int)
signal on_resolution_selected(index : int)

# Audio Signals
signal on_master_sound_set(value: float)
signal on_music_sound_set(value: float)
signal on_sfx_sound_set(value: float)

# Dict
signal set_settings_dictionary(settings_dict : Dictionary)
signal load_settings_data(settings_dict : Dictionary)

func emit_load_settings_data(settings_dict : Dictionary):
	load_settings_data.emit(settings_dict) 
	

func emit_set_settings_dictionary(settings_dict : Dictionary):
	set_settings_dictionary.emit(settings_dict)
	
func emit_on_window_mode_selected(index):
	on_window_mode_selected.emit(index)

func emit_on_resolution_selected(index):
	on_resolution_selected.emit(index)

func emit_master_sound_set(value):
	on_master_sound_set.emit(value)

func emit_music_sound_set(value):
	on_music_sound_set.emit(value)

func emit_sfx_sound_set(value):
	on_sfx_sound_set.emit(value)
