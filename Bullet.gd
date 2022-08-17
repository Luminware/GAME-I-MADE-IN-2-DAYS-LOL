extends Area2D

onready var anim = $AnimationPlayer

var speed = 200
var dead = false

func _ready():
	$Effect.visible = false

func _physics_process(delta):
	if not dead:
		position += transform.y * speed * delta
	
	if position.x > 472 or position.x < 0:
		die()
	if position.y > 268 or position.y < 0:
		die()
	
func die():
	rotation_degrees = 0
	anim.play("die")
	dead = true

func _on_AnimationPlayer_animation_finished(die):
	queue_free()
