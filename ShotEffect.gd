extends Node2D

onready var animationPlayer = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	animationPlayer.play("Spawn")

func _on_AnimationPlayer_animation_finished(Spawn):
	queue_free()
