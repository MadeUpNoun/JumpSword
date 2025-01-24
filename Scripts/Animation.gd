extends CharacterBody2D

var direction: Vector2

func _process(delta):
	handle_animation()

func handle_animation():
	var animated_sprite = $AnimatedSprite2D
	# Change based on animation names
	if velocity.x != 0:
		animated_sprite.play("Walking")
		if direction.x < 0:
			animated_sprite.flip_h = true
		elif direction.x > 0: 
			animated_sprite.flip_h = false
	else:
		animated_sprite.play("Idle")
