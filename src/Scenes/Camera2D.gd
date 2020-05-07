extends Camera2D

var current_zoom
var min_zoom
var max_zoom
var zoom_factor = .5 # < 1 = zoom_in; > 1 = zoom_out
var transition_time = 0.35

func _ready():
	max_zoom = zoom.x
	min_zoom = max_zoom * zoom_factor

func zoom_in(new_offset):
	transition_camera(Vector2(min_zoom, min_zoom), new_offset)

func zoom_out(new_offset, zoom_counter):
	transition_camera(Vector2(max_zoom + zoom_counter, max_zoom + zoom_counter), new_offset)

func transition_camera(new_zoom, new_offset):
	if new_zoom != current_zoom:
		current_zoom = new_zoom
		print(current_zoom)
		$Tween.interpolate_property(self, "zoom", get_zoom(), current_zoom, transition_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.interpolate_property(self, "offset", get_offset(), new_offset, transition_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
