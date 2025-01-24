extends CharacterBody2D

@onready var E = $E

@onready var anim = $AnimatedSprite2D

const SPEED = 10.0

var possessed = false


func _physics_process(delta: float) -> void:
	if possessed == false:
		if $Area2D.has_overlapping_bodies():
			E.show()
			if Input.is_action_just_pressed("possess"):
				print("possess")
				E.hide()
				anim.play("WakeUp")
				await anim.animation_finished
				possessed = true
		else:
			E.hide()
	
	if possessed == true:
		var direction := Input.get_axis("Move_Left","Move_Right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	
		move_and_slide()
		
		if Input.is_action_just_pressed("possess"):
			possessed = false
			anim.play_backwards("WakeUp")
			await anim.animation_finished
