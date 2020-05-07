extends KinematicBody2D

export (int) var run_speed = 500
export (int) var jump_speed = -400
export (int) var gravity = 1000

var wind_speed = -2000
var float_speed = -1200
var velocity = Vector2()
var zoom_counter = 0
var jumping = false
var flying = false
var able_to_float = false
var zoom_out = false

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_pressed("ui_select")
	
	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
	
func _physics_process(delta):
	get_input()
	if jumping and is_on_floor():
		jumping = false
	if flying:
		velocity.y += wind_speed * delta
		able_to_float = true
		if able_to_float and Input.is_action_pressed("ui_shift"):
			velocity.y += float_speed * delta
	else:
		velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	
	if zoom_out:
		zoom_counter+=1
		zoom_counter = clamp(zoom_counter, 0, 4)
		$Camera2D.zoom_out(Vector2(5,5), zoom_counter)
	else:
		$Camera2D.zoom_in(Vector2(1,1))

	
func _on_Wind_body_entered(body):
	if body.name in 'Player':
		flying = true

func _on_Wind_body_exited(body):
	if body.name in 'Player':
		flying = false

func _on_Ceiling_body_entered(body):
	zoom_out= !zoom_out

func _on_Ceiling_body_exited(body):
	zoom_out= !zoom_out

