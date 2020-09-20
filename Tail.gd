extends Sprite

export(NodePath) var rewinder_node
onready var rewinder = get_node(rewinder_node)
	
func _process(delta):
	if rewinder and !rewinder.rewind_data.empty():
		if !RewindSystem.rewinding:
			global_position = rewinder.rewind_data.back().pos
