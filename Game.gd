extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_space"):
		$"Player/Camera2D".zoom = Vector2(2.5,2.5)
		get_tree().reload_current_scene()	

func _on_Area2D_body_entered(body):
	if body.name in 'Player':
		print("Player has cleared this level.")
