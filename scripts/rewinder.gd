extends Node
class_name Rewinder


var rewind_data = []
var rewind_tick = 0.0
# var rewind_speed: float = 3.0

onready var parent = get_parent()


func _process(delta):
	if RewindSystem.rewinding: 
	# rewinding
		if !rewind_data.empty():
			__rewind(rewind_data.pop_front())
	else:
	# recording
		if rewind_tick < 1:
			rewind_tick += 1/RewindSystem.rewind_speed
		else:
			rewind_tick = 0
			RewindSystem.rewinding = false
			rewind_data.push_front(__record())
			if rewind_data.size() > RewindSystem.max_entries:
				rewind_data.pop_back()

	parent.set_physics_process(!RewindSystem.rewinding)

func __record():
	return parent.global_position	

func __rewind(data):
	parent.global_position = data
