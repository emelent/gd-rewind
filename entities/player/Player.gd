extends Character
class_name Player

export(float) var jump_force = 400
onready var state_machine = $StateMachine

var rewind_data = []
const max_entries = 100
var rewind_frame = 0.0
var rewind_speed: float = 2

func _process(delta):
	if Input.is_action_pressed("rewind"):
		RewindManager.rewinding = true
		if !rewind_data.empty():
			var data = rewind_data.pop_front()
			global_position = data.pos
			motion = data.vel 
	else:
		if rewind_frame < 1:
			rewind_frame += 1/rewind_speed
		else:
			rewind_frame = 0
			RewindManager.rewinding = false
			rewind_data.push_front({
				pos = global_position,
				vel = motion
			})
			if rewind_data.size() > max_entries:
				rewind_data.pop_back()
	set_physics_process(!RewindManager.rewinding)
	
	
func handle_movement_input():
	direction = 0
	if Input.is_action_pressed("move_left"):
		direction = -1
		state_machine.set_current_state(Global.player_states.walk)
	elif Input.is_action_pressed("move_right"):
		direction = 1
		state_machine.set_current_state(Global.player_states.walk)
	else:
		state_machine.set_current_state(Global.player_states.idle)
	motion.x = direction * speed
