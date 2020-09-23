extends Rewinder

onready var initial_mode = parent.mode
func _physics_process(delta):
	# disable physics while rewinding
	if RewindSystem.rewinding:
		parent.mode = RigidBody2D.MODE_KINEMATIC

	elif !RewindSystem.rewinding and parent.mode != initial_mode:
		"""
			Not sure why this is, but the physics system tries to 
			pick up where it left off before the RigidBody2D.mode
			was set to KINEMATIC or whatever(i.e. not RIGID), and
			this results in the physics system resetting the position
			and forces to where it was before the rewind, overwriting
			what I set during the rewind. 

			So to fix this, I yield 1 physics frame(or however many it
			yields, since the code seems to run twice before and twice after),
			then if the distance between the current parent.global_position
			and pre_pos is greater than my allowed margin, it means the physics
			server has overwritten my values, and I overwrite it to the last correct
			data. This means that rewinding a RigidBody2D will end at position n-1, 
			instead of n, when rewinding since this overwrite happens 
			most of the time.
		"""
		var pre_pos = parent.global_position
		var pre_lin_vel = parent.linear_velocity
		var pre_ang_vel = parent.angular_velocity
		var pre_rot = parent.rotation
		parent.mode = initial_mode

		yield(get_tree(), "physics_frame")

		if (pre_pos as Vector2).distance_to(parent.global_position) > 2:
			parent.global_position = pre_pos
			parent.linear_velocity = pre_lin_vel
			parent.angular_velocity = pre_ang_vel 
			parent.rotation = pre_rot


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
