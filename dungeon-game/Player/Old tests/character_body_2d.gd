extends CharacterBody2D
class_name PlayerController

@export var move_speed = 20.0
@export var hp_max:int = 100 
@export var hp:int = hp_max


var direction : Vector2

enum Facing {UP, DOWN, LEFT, RIGHT}
var player_facing : Facing

func _physics_process(delta):
	# Sets the y value of the player input
	if Input.is_action_pressed(&"movement_up"):
		direction.y = -1
		player_facing = Facing.UP
	elif Input.is_action_pressed(&"movement_down"):
		direction.y = 1
		player_facing = Facing.DOWN
	else:
		direction.y = 0
	# Sets the x value of the player input
	if Input.is_action_pressed(&"movement_right"):
		direction.x = 1
		player_facing = Facing.RIGHT
	elif Input.is_action_pressed(&"movement_left"):
		direction.x = -1
		player_facing = Facing.LEFT
	else:
		direction.x = 0
		
	
	direction = direction.normalized()
	velocity = direction *  move_speed * delta * 200
	move_and_slide()

func receive_damage(base_damage:int):
		var actual_damage = base_damage
		self.hp -= actual_damage
		print(name + " received " +str(actual_damage) + " Damage ")

#detects if hitbox is touching hurtbox
func _on_hurt_box_area_entered(hitbox):
	receive_damage(hitbox.damage)
	var base_damage= hitbox.damage
	self.hp -= base_damage
	print(hitbox.get_parent().name + "'s hitbox touched" + name + "'s hurtbox touched" +str(base_damage))
	pass # Replace with function body.
