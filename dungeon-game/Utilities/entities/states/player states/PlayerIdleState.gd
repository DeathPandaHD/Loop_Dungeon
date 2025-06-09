extends "res://Utilities/entities/states/State.gd"
class_name PlayerIdle

@export var animator : AnimationPlayer

func Enter():
#	animator.play("Idle")
	pass
	
func Update(_delta : float):
	if(Input.get_vector(&"movement_left", &"movement_right", &"movement_up", &"movement_down").normalized()):
		state_transition.emit(self, "Moving")
