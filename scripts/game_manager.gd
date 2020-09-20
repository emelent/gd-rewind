extends Node


# OVERRIDES
func _ready():
	# limit Godot's cpu usage (this stops my cpu from going brrrr)
	OS.set_low_processor_usage_mode(true)
#    Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

func _input(event):
	if OS.is_debug_build():
		if event.is_action_pressed("debug_quit") :
			quit()
		if event.is_action_pressed("debug_restart") :
			get_tree().reload_current_scene()

# CUSTOM 
func goToScene(path):
	return get_tree().change_scene(path)


func quit():
	get_tree().quit()
