extends RigidBody2D

@onready var Arrow_turn_table = $Arrow_turn_table

# not entirely sure but this func is specifcally whats used to move rigid bodys with forces
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var velocity := state.get_linear_velocity()
	pass


func _physics_process(delta: float) -> void:
	#controls left and right turning
	var turn_direction = 0
	if Input.is_action_just_pressed("Move_Left"):
		turn_direction += -10.0
	if Input.is_action_just_pressed("Move_Right"):
		turn_direction += 10.0
	angular_velocity += turn_direction
	
	Arrow_turn_table.look_at(get_global_mouse_position())
	
	if InputEventMouseButton.MOUSE_BUTTON_LEFT.is_pressed(): 
		Arrow_turn_table.show()
	else:
		Arrow_turn_table.hide()
	
