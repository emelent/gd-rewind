extends Character
class_name Player


export(float) var jump_force = 800
onready var state_machine = $StateMachine
onready var animated_sprite = $Pivot/AnimatedSprite
onready var pivot = $Pivot

func _process(delta):
	if Input.is_action_pressed("rewind"):
		RewindSystem.rewinding = true
		animated_sprite.playing = false
	else:
		RewindSystem.rewinding = false
		animated_sprite.playing = true 
		# animated_sprite.play()
		
	if direction != 0:
		pivot.scale.x = direction
	
	
func handle_movement_input():
	direction = 0
	if RewindSystem.rewinding: return
	if Input.is_action_pressed("move_left"):
		direction = -1
		state_machine.set_current_state(Global.player_states.walk)
	elif Input.is_action_pressed("move_right"):
		direction = 1
		state_machine.set_current_state(Global.player_states.walk)
	else:
		state_machine.set_current_state(Global.player_states.idle)
	motion.x = direction * speed
