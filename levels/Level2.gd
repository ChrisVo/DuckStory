extends "res://Game.gd"

func _on_Area2D_body_entered(body):
	if body.name in 'Player':
		get_tree().change_scene("res://src/Scenes/GameOver.tscn")
