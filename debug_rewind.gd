extends VBoxContainer


export(NodePath) var player_node 

onready var player = get_node(player_node)
onready var rewinder = player.get_node("Rewinder")

func _process(delta):
	if !player: return
	
	var final_pos = "None"
	var final_vel = "None"
	if !rewinder.rewind_data.empty():
		var data = rewinder.rewind_data.back()
		final_pos = data.pos
		final_vel = data.lin_vel
		
	$FinalPosition.text = "FINAL_POS: %s" % final_pos 
	$FinalVelocity.text = "FINAL_VEL: %s" % final_vel
	
	$CurrentPosition.text = "CURR_POS: %s" % player.global_position
	$CurrentVelocity.text = "CURR_VEL: %s" % player.linear_velocity
