extends "res://Utilities/entities/entitybase.gd"


enum Facing {UP, DOWN, LEFT, RIGHT}
var player_facing : Facing

func _physics_process(delta):
	# Sets the y value of the player input
	if Input.is_action_pressed(&"movement_up"):
		direction.y = -1
		player_facing = Facing.UP
		print ("Facing up")
	elif Input.is_action_pressed(&"movement_down"):
		direction.y = 1
		player_facing = Facing.DOWN
		print ("Facing down")
	else:
		direction.y = 0
	# Sets the x value of the player input
	if Input.is_action_pressed(&"movement_right"):
		direction.x = 1
		player_facing = Facing.RIGHT
		print ("Facing right")
	elif Input.is_action_pressed(&"movement_left"):
		direction.x = -1
		player_facing = Facing.LEFT
		print ("Facing left")
	else:
		direction.x = 0
		print ("Facing idle")
	
	direction = direction.normalized()
	velocity = direction *  move_speed * delta * 200
	move_and_slide()
