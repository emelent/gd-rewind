extends State


func _ready():
	state_name = Global.player_states.walk
	._ready()

func _input(event):
	if event.is_action_pressed("jump") and character.is_on_floor():
		state_machine.set_current_state(Global.player_states.jump)
	
func _process(delta):
	(character as Player).handle_movement_input()
	
