extends Rewinder

var rewind_ghost = load("res://entities/RewindGhost.tscn")
var ghost_tick = 0
var ghost_rate = 1/4.0
func __record():
	return {
		pos = parent.global_position,
		vel = parent.motion,
		animation = parent.state_machine._current_state.state_name,
		frame = parent.animated_sprite.frame,
		pivot_scale_x= parent.pivot.scale.x
	}

func __rewind(data):
	parent.global_position = data.pos
	parent.motion = data.pos
	parent.animated_sprite.animation = data.animation
	parent.animated_sprite.frame = data.frame
	parent.pivot.scale.x = data.pivot_scale_x
	
	ghost_tick += ghost_rate
	if ghost_tick >= 1:
		var ghost : Sprite = rewind_ghost.instance()
		ghost_tick = 0
		ghost.texture = parent.animated_sprite.frames.get_frame(data.animation, data.frame)
		ghost.global_position = parent.global_position
		ghost.scale = parent.animated_sprite.scale
		ghost.scale.x *= data.pivot_scale_x
		parent.get_parent().add_child(ghost)
	
