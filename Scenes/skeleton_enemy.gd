extends CharacterBody2D
class_name SkeletonEnemy

func _physics_process(delta: float) -> void:
	move_and_slide()
	
	if velocity.length() > 0:
		# Change Based On Animation
		$AnimatedSprite2D.play("Walking")
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
