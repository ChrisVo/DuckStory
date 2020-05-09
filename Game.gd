extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_space"):
		reset_level()
		$"Player/Camera2D".zoom = Vector2(2.5,2.5)

func reset_level():
	get_tree().reload_current_scene()	

# This function gets called when the user reaches the last platform.
func _on_Area2D_body_entered(body):
	if body.name in 'Player':
		get_tree().change_scene(("res://levels/Level2.tscn"))


func _on_DropDetector_body_entered(body):
	reset_level()

