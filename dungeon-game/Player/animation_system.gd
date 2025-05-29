extends Node
@onready var player_controller = $'..'
@onready var animation_player = $'../AnimationPlayer'
@onready var sprite_2d = $'../Sprite2D'

func _process(delta):
	if player_controller.velocity.length() > 0.0:
		# play movement animations
		if player_controller.player_facing == player_controller.Facing.DOWN:
			animation_player.play(&"Walk_down")
		elif player_controller.player_facing == player_controller.Facing.UP:
			animation_player.play(&"Walk_up")
		elif player_controller.player_facing == player_controller.Facing.RIGHT:
			animation_player.play(&"Walk_left")
		elif player_controller.player_facing == player_controller.Facing.LEFT:
			animation_player.play(&"Walk_Right")
		
	else:
		# play idle animations
		if player_controller.player_facing == player_controller.Facing.DOWN:
			animation_player.play(&"Idle")
		elif player_controller.player_facing == player_controller.Facing.UP:
			animation_player.play(&"Idle")
		elif player_controller.player_facing == player_controller.Facing.RIGHT:
			animation_player.play(&"Idle")
			sprite_2d.flip_h = true
		elif player_controller.player_facing == player_controller.Facing.LEFT:
			animation_player.play(&"Idle")
