extends Node2D

onready var enemy = preload("res://Enemy.tscn")

func _on_Timer_timeout():
	var ast = enemy.instance()
	add_child(ast)
