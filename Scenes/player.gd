extends RigidBody2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var velocity := state.get_linear_velocity()
	pass


func _physics_process(delta: float) -> void:
	var turn_direction = 0
	if Input.is_action_just_pressed("Move_Left"):
		turn_direction += -10.0
	if Input.is_action_just_pressed("Move_Right"):
		turn_direction += 10.0
	angular_velocity += turn_direction
	print (angular_velocity)
