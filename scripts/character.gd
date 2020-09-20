extends KinematicBody2D
class_name Character

export(float) var speed = 300
export(Vector2) var gravity = Global.gravity


var motion = Vector2.ZERO
var direction = 0
var allow_gravity = true


func _physics_process(delta):
	__apply_gravity(delta)
	motion = move_and_slide(motion, Vector2.UP)


func __apply_gravity(delta):
	if allow_gravity:
		motion += gravity * delta
