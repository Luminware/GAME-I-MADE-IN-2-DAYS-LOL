extends KinematicBody2D

var speed = 25
var health = 1
var rotation_speed = rand_range(0.1, 5)
var velocity = Vector2()

func _ready():
	var rng = RandomNumberGenerator.new()
	var random_value = rand_range(0, 270)
	if randf() > 0.5: 
		position.x = 480
		speed = -25
	else:
		position.x = 0
	position.y = (random_value)

func _physics_process(delta):
	velocity = Vector2(speed, 0).rotated(rotation)
	velocity = move_and_slide(velocity)
	if health == 0:
		queue_free()
	if position.x > 500 or position.x < -100:
		self.queue_free()
	$Sprite.rotation += rotation_speed * delta
		
func hurt(dmg):
	health -= dmg
	if health == 0:
		die()
	
func die():
	pass

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.hurt()
		die()

func _on_Area2D_area_entered(area):
	if area.is_in_group("Bullet"):
		hurt(1)
		area.die()
