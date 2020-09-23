extends State


func _ready():
	state_name = Global.player_states.walk
	._ready()

func _input(event):
	if event.is_action_pressed("jump") and character.is_on_floor():
		state_machine.set_current_state(Global.player_states.jump)
	
func _process(delta):
	(character as Player).handle_movement_input()

func __enter(previous_state):
	# if previous_state == null:
	# 	return

	# match previous_state.state_name:
		# Global.player_states.idle:
	(character as Player).animated_sprite.play(state_name)
	
