extends KinematicBody2D
class_name Character

export(float) var speed = 300
export(Vector2) var gravity = Global.gravity
export(int, 0, 200) var inertia = 50

var motion = Vector2.ZERO
var direction = 0
var allow_gravity = true



func _physics_process(delta):
	__apply_gravity(delta)
	motion = move_and_slide(motion, Vector2.UP,false, 4, PI/4, false)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group(Global.group.bodies):
			 collision.collider.apply_central_impulse(-collision.normal * inertia)
			


func __apply_gravity(delta):
	if allow_gravity:
		motion += gravity * delta
