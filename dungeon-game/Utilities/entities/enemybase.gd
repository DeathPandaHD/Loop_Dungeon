extends "res://Utilities/entities/entitybase.gd"
@onready var player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*move_speed
	move_and_slide()
#used to flip enemy sprite:
	if direction.x > 0.1:
		sprite.flip_h = true
	elif direction.x < -0.1:
		sprite.flip_h = false
