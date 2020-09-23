extends Rewinder


func __record():
	return {
		pos = parent.global_position,
		vel = parent.motion,
		animation = parent.state_machine.name,
		frame = parent.animated_sprite.frame,
		pivot_scale_x= parent.pivot.scale.x
	}

func __rewind(data):
	parent.global_position = data.pos
	parent.motion = data.pos
	parent.animated_sprite.animation = data.animation
	parent.animated_sprite.frame = data.frame
	parent.pivot.scale.x = data.pivot_scale_x
