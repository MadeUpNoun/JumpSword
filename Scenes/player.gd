extends RigidBody2D

@onready var Arrow_turn_table = $Arrow_turn_table
@onready var Arrow = $Arrow_turn_table/Arrow
var turn_direction = 0.0

var leap_cooldown = false
var on_floor = false
# not entirely sure but this func is specifcally whats used to 
#move rigid bodys with forces
#func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
#
	#var i := 0
	#while i < state.get_contact_count():
		#var normal := state.get_contact_local_normal(i)
		#if normal.dot(Vector2.UP) != null:
			#on_floor = normal.dot(Vector2.UP) >  0.99
		#else:
			#on_floor = false
		#i += 1



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
		elif turn_direction < 0 :
			turn_direction += 0.1
	angular_velocity += turn_direction
	
	Arrow_turn_table.look_at(get_global_mouse_position())
	if leap_cooldown == false:
		if Input.is_action_pressed("Leap") and on_floor:
			Arrow_turn_table.show()
			leap_charge()
		elif Input.is_action_just_released("Leap"):
			Arrow_turn_table.hide()
			apply_central_force(Vector2(0.0,-1.5).rotated(
				Arrow_turn_table.global_rotation + (PI/2))
			 * 50  * charge)
			charge = 0.0
			$Leap_cooldown.start()
			leap_cooldown = true
		else:
			Arrow_turn_table.hide()
			charge = 0.0
	



	
var Max_charge = 100.0
var charge = 0.0
#logic behind Leap mechanic
func leap_charge():
	
	charge = clamp(charge + 1,0,100)
	
	Arrow.set_frame(charge * (57/Max_charge))


func _on_leap_cooldown_timeout() -> void:
	leap_cooldown = false




func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	on_floor = true
	print("entered")


func _on_area_2d_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	on_floor = false
	print("exited")
