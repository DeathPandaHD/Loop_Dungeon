extends State
class_name enemy_chase_state

@export var move_speed := float(30)

@export var animator : AnimationPlayer
@onready var body = $"../.."

func Enter():
	#animator.play("Chasing")
	print("player chasing")


func Update(_delta):
	var player = get_tree().get_first_node_in_group("player") as CharacterBody2D
	var chase_direction = player.position - body.position as Vector2

	body.velocity = chase_direction.normalized() * move_speed
	body.move_and_slide()
	
		
