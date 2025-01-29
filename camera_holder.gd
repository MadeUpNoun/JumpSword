extends Node2D




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
	
