extends Node
class_name State

export var enabled = false setget set_enabled

var state_name = "unnamed_state"
var character: Character

onready var state_machine = get_parent()

func _ready():
	set_enabled(enabled)


func set_enabled(b):
	enabled = b
	set_process(enabled)
	set_process_input(enabled)
	set_physics_process(enabled)


func __enter(prev_state):
	pass

func __exit(next_state):
	pass
