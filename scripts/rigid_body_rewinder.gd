extends Rewinder

onready var initial_mode = parent.mode
func _process(delta):
	if RewindSystem.rewinding:
		parent.mode = RigidBody2D.MODE_KINEMATIC
	else:
		parent.mode = initial_mode

func __record():
	return {
		pos = parent.global_position,
		lin_vel = parent.linear_velocity,
		ang_vel = parent.angular_velocity,
		rot = parent.rotation
	}

func __rewind(data):
	parent.global_position = data.pos
	parent.linear_velocity = data.lin_vel
	parent.angular_velocity = data.ang_vel
	parent.rotation = data.rot
