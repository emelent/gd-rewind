extends StateMachine

const player_states = {
	walk = "walk",
	jump = "jump"
}

func _ready():
	add_state(player_states.walk)
	add_state(player_states.jump)

