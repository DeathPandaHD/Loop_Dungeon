extends "res://Utilities/entities/entitybase.gd"
@onready var player = get_tree().get_first_node_in_group("player")
@onready var fsm = $'State Machine' as FiniteStateMachine
var player_in_range = false

@export var chase_node : Node

#Register player proximity, start chasing if we are idling when the player gets close
func _on_detection_area_area_entered(body):
	if body.is_in_group("player"):
		player_in_range = true
		print("player in range")
		#We don't want this to happen from the death state, only from idle
		if fsm.current_state.name == "enemy_idle_state": 
			fsm.force_change_state("enemy_chase_state")


func _on_detection_area_area_exited(body):
	if body.is_in_group("player"):
		player_in_range = false
		fsm.change_state(chase_node, "enemy_idle_state")
		print("player in range")
		
func _die():
	super() #calls _die() on base-class CharacterBase
	fsm.force_change_state("enemy_death_state")
	
	

#@export var move_speed = 20.0
#@export var speed = 75
#
#
#func _physics_process(delta):
	#move()
#
#func move():
	#direction = direction.normalized()
	#velocity = direction *  move_speed
	#move_and_slide()
