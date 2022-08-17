extends KinematicBody2D

export (int) var speed = 50
export (float) var rotation_speed = 4

onready var bullet = preload("res://Bullet.tscn")
onready var shoteffect = preload("res://ShotEffect.tscn")
onready var spawn = $Position2D

var velocity = Vector2()
var rotation_dir = 0
var tick_count = 0
var health = 4

func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		rotation_dir += 1
	if Input.is_action_pressed("left"):
		rotation_dir -= 1
	if Input.is_action_pressed("up"):
		velocity = Vector2(speed*2, 0).rotated(rotation)
	if Input.is_action_pressed("down"):
		velocity = Vector2(-speed/4, 0).rotated(rotation)
	elif Input.is_action_pressed("up"):
		velocity = Vector2(speed*2, 0).rotated(rotation)
	else:
		velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
	
func shoot():
	var shot = bullet.instance()
	var effect = shoteffect.instance()
	owner.add_child(effect)
	owner.add_child(shot)
	effect.transform = spawn.global_transform
	shot.transform = spawn.global_transform
	
func hurt():
	health -= 1
	if health == 0:
		get_tree().reload_current_scene()

func _on_Timer_timeout():
	shoot()
	tick_count += 1
