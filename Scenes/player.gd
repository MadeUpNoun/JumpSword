extends RigidBody2D
class_name Player

@onready var Arrow_turn_table = $Arrow_turn_table
var turn_direction = 0.0
# not entirely sure but this func is specifcally whats used to move rigid bodys with forces
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if Input.is_action_just_released("Leap"):
		pass

#phys func that runs each frame
func _physics_process(delta: float) -> void:
	#controls left and right turning
	if Input.is_action_pressed("Move_Left"):
		turn_direction = clamp(turn_direction - 0.01,-0.5,0.5)
	elif Input.is_action_pressed("Move_Right"):
		turn_direction = clamp(turn_direction + 0.01,-0.5,0.5)
	else:
		if turn_direction > 0:
			turn_direction -= 0.1
		else:
			turn_direction += 0.1
			print(turn_direction)
	angular_velocity += turn_direction
	
	if Input.is_action_pressed("Leap"):
		Arrow_turn_table.show()
	else:
		Arrow_turn_table.hide()
	
	Arrow_turn_table.look_at(get_global_mouse_position())
	
