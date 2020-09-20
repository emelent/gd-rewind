extends Rewinder


func __record():
	return {
		pos = parent.global_position,
		vel = parent.motion
	}

func __rewind(data):
	parent.global_position = data.pos
	parent.motion = data.pos
