extends CharacterBody2D

@onready var E = $E

@onready var anim = $AnimatedSprite2D
@onready var player = $"../Player"
@onready var Arrow = $Arrow_turn_table/Arrow
@onready var Arrow_turn_table = $Arrow_turn_table
const SPEED = 10.0

var possessed = false


func _physics_process(delta: float) -> void:
	if possessed == false:
		Arrow_turn_table.hide()
		$Camera2D.enabled = false
		if $Area2D.has_overlapping_bodies():
			E.show()
			if Input.is_action_just_pressed("possess"):
				E.hide()
				anim.play("WakeUp")
				$Camera2D.enabled = true
				await anim.animation_finished
				player.possession = true
				possessed = true
				
		else:
			E.hide()
		
	if possessed == true:
		E.hide()
		var direction := Input.get_axis("Move_Left","Move_Right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
		
		if direction < 0:
			anim.play("WalkLeft")
		elif direction > 0:
			anim.play("WalkRight")
		else:
			anim.play("Idle")
		
		$Camera2D.enabled = true
		player.skeleton_transform = global_transform

		if Input.is_action_just_pressed("possess"):
			possessed = false
			player.possession = false
			anim.play_backwards("WakeUp")
			await anim.animation_finished
			
		#rotates th player while possessed
		player.rotate(Arrow_turn_table.global_rotation + (PI/2))
		
		#throw logic
		Arrow_turn_table.look_at(get_global_mouse_position())
		if Input.is_action_pressed("Leap"):
			Arrow_turn_table.show()
			throw_charge()
		elif Input.is_action_just_released("Leap"):
			Arrow_turn_table.hide()
			#important to reset the player before applying the force
			player.possession = false
			player.apply_central_force(Vector2(0.0,-1.5).rotated(
				Arrow_turn_table.global_rotation + (PI/2))
			 * 100  * charge)
			
			charge = 0.0
			possessed = false
			anim.play_backwards("WakeUp")
			await anim.animation_finished
		else:
			Arrow_turn_table.hide()
			charge = 0.0




var Max_charge = 100.0
var charge = 0.0
#logic behind Leap mechanic
func throw_charge():
	
	charge = clamp(charge + 1,0,100)
	
	Arrow.set_frame(charge * (57/Max_charge))
	
	
	
	
	
	
	
	
	
	
