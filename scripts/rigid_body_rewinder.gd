extends Rewinder

onready var initial_mode = parent.mode
func _process(delta):
	if RewindSystem.rewinding:
		parent.mode = RigidBody2D.MODE_KINEMATIC
	else:
		parent.mode = initial_mode

func __record():
	if !rewind_data.empty():
		var prev = rewind_data[0]
		var pos = parent.global_position as Vector2
		if pos.distance_to(prev.pos) > 100:
			# I cannot figure out what causes the code to get here,
			# This is section is just to see part of the bug. This happens
			# when rewinding the falling of the stack of boxes
			print("problemo")
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
