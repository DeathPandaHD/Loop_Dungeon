extends CharacterBody2D
#signal hp_changed()

@export var hp_max = 100
@export var hp = hp_max
var direction : Vector2
var is_dead : bool = false


@onready var sprite = $Sprite2D
@onready var collshape =$CollisionShape2D
@onready var animplayer =$AnimationPlayer



func _die():
	if(is_dead):
		return
		
	is_dead = true
	#Remove/destroy this character once it's able to do so unless its the player
	await get_tree().create_timer(1.0).timeout
	if is_instance_valid(self) and not is_in_group("player"):
		queue_free()
	
func receive_damage(base_damage):
		var actual_damage = base_damage
		self.hp -= actual_damage
		print(name + " received " +str(actual_damage) + " Damage ")
		print(name + " players new health "+ str(hp))

#detects if hitbox is touching hurtbox
func _on_hurt_box_area_entered(hitbox):
	receive_damage(hitbox.damage)
	if hp < 0:
		
	#fully heals player on death
		hp = hp_max
		print("full heal " +str(hp))
	
