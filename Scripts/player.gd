extends RigidBody2D
class_name Player

@onready var Arrow_turn_table = $Arrow_turn_table
@onready var Arrow = $Arrow_turn_table/Arrow
var turn_direction = 0.0

var leap_cooldown = false
var on_floor = false
@onready var possession = false

var skeleton_transform 
# not entirely sure but this func is specifcally whats used to 
#move rigid bodys with forces
#func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
#




#phys func that runs each frame
func _physics_process(delta: float) -> void:
	if possession == false:
		show()
		freeze = false
		on_floor = $Area2D.has_overlapping_bodies()

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
				
	if possession == true:
		$Camera2D.enabled = false
		freeze = true
		global_transform = skeleton_transform



var Max_charge = 100.0
var charge = 0.0
#logic behind Leap mechanic
func leap_charge():
	
	charge = clamp(charge + 1,0,100)
	
	Arrow.set_frame(charge * (57/Max_charge))


func _on_leap_cooldown_timeout() -> void:
	leap_cooldown = false
