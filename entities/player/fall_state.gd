extends State

func _ready():
	state_name = Global.player_states.fall
	._ready()

func _process(delta):
	(character as Player).handle_movement_input()
	
func _physics_process(delta):
	if character.is_on_floor():
		state_machine.set_current_state(Global.player_state.idle)


func __enter(previous_state):
	(character as Player).animated_sprite.play(state_name)
	
func __exit(next_state):
	pass
	
	

