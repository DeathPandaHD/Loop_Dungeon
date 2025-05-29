extends CharacterBody2D
signal hp_changed(new_hp)
@export var move_speed = 20.0
@export var hp_max = 100
@export var hp = hp_max
var direction : Vector2
@export var speed = 75

@onready var sprite = $Sprite2D
@onready var collshape =$CollisionShape2D
@onready var animplayer =$AnimationPlayer

func _physics_process(delta):
	move()

func move():
	direction = direction.normalized()
	velocity = direction *  move_speed
	move_and_slide()

func die():
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
	
