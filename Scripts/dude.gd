extends Node2D

@onready var back_anim = $back 
@onready var front_anim = $front
@onready var player = $"../Player"
@onready var end_screen = $"../End game screen"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back_anim.show()
	back_anim.play("default")
	front_anim.hide()
	end_screen.hide()



func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	player.game_over = true
	back_anim.play("dead")
	front_anim.show()
	front_anim.play("dead")
	end_screen.show()
	
