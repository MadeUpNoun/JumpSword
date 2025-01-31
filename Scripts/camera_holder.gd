extends Node2D




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $Level_1_Camera/Level_1_area.has_overlapping_areas():
		$Level_1_Camera.enabled = true
	else:
		$Level_1_Camera.enabled = false
		
	if $Level_2_Camera/Level_2_area.has_overlapping_areas():
		$Level_2_Camera.enabled = true
	else:
		$Level_2_Camera.enabled = false
	if $Level_3_Camera/Level_3_area.has_overlapping_areas():
		$Level_3_Camera.enabled = true
	else:
		$Level_3_Camera.enabled = false
	if $Level_4_Camera/Level_4_area.has_overlapping_areas():
		$Level_4_Camera.enabled = true
	else:
		$Level_4_Camera.enabled = false
	if $Level_5_Camera/Level_5_area.has_overlapping_areas():
		$Level_5_Camera.enabled = true
	else:
		$Level_5_Camera.enabled = false
	if $Level_6_Camera/Level_6_area.has_overlapping_areas():
		$Level_6_Camera.enabled = true
	else:
		$Level_6_Camera.enabled = false
	if $Level_7_Camera/Level_7_area.has_overlapping_areas():
		$Level_7_Camera.enabled = true
	else:
		$Level_7_Camera.enabled = false
	if $Level_8_Camera/Level_8_area.has_overlapping_areas():
		$Level_8_Camera.enabled = true
	else:
		$Level_8_Camera.enabled = false
	if $Level_9_Camera/Level_9_area.has_overlapping_areas():
		$Level_9_Camera.enabled = true
	else:
		$Level_9_Camera.enabled = false
	if $Level_10_Camera/Level_10_area.has_overlapping_areas():
		$Level_10_Camera.enabled = true
	else:
		$Level_10_Camera.enabled = false
	if $Level_11_Camera/Level_11_area.has_overlapping_areas():
		$Level_11_Camera.enabled = true
	else:
		$Level_11_Camera.enabled = false
