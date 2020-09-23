extends Node
class_name StateMachine

export(NodePath) var initial_state
var _current_state: State = null
var _previous_state: State = null
var states = {}

onready var character: Character = get_parent()
signal state_changed

func _ready():
	for child in get_children():
		load_state(child)
		

	var init_state = get_node(initial_state) as State
	if init_state:
		call_deferred("set_current_state", init_state.state_name)

func load_state(state: State):
	if state == null: return
	state.character = character
	states[state.state_name] = state 
	
func add_state(state_name):
	states[state_name] = states.size()


func set_current_state(state_name):
	if _current_state and _current_state.state_name == state_name: return
	
	var new_state = states[state_name]
	if !new_state: return
	
	_previous_state = _current_state
	_current_state = new_state
	emit_signal("state_changed", new_state.state_name)
#	print("current state => " + _current_state.state_name)

	if _previous_state != null:
		_previous_state.__exit(_current_state)
		_previous_state.enabled = false

	_current_state.__enter(_previous_state)
	_current_state.enabled = true
