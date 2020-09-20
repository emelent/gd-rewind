extends Character
class_name Player

export(float) var jump_force = 400
onready var state_machine = $StateMachine

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
