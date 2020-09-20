extends Sprite

export(NodePath) var player_node

onready var player = get_node(player_node)

	
func _process(delta):
	if player and !player.rewind_data.empty():
		if !RewindManager.rewinding:
			global_position = player.rewind_data.back().pos
