extends CharacterBody2D

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
	var base_damage= hitbox.damage
	self.hp -= base_damage
	print(hitbox.get_parent().name + "'s hitbox touched" + name + "'s hurtbox touched " +str(base_damage))
