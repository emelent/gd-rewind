extends State

func _ready():
	state_name = Global.player_states.jump
	._ready()

func _process(delta):
	(character as Player).handle_movement_input()
	
func _physics_process(delta):
	if character.is_on_floor():
		state_machine.set_current_state(Global.player_state.idle)


func __enter(previous_state):
	character.motion.y = -character.jump_force
	
func __exit(next_state):
	pass
	
	
