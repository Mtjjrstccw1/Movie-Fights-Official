extends StateMachine
@onready var id = get_parent().id
@onready var animTree : AnimationTree = $AnimationTree

func _ready():
	add_state("IDLE")
	add_state("JUMP")
	add_state("FALLING")
	add_state("WALK")
	add_state("RUN")
	add_state("CROUCH")
	add_state("HIGHBLOCK")
	add_state("LOWBLOCK")
	add_state("HIGHATTACK")
	add_state("LOWATTACK")
	add_state("DODGE")
	add_state("AERIAL")
	call_deferred("set_state", states.IDLE)

	
func state_logic(delta):
	parent.updateframes(delta)
	parent._physics_process(delta)


func get_transition(delta):
	parent.set_up_direction(Vector2.UP)
	parent.move_and_slide()
	
	match state:
		states.IDLE:
			if Input.get_action_strength("r_up_1") == 1:
				return states.RUN
			
			if Input.get_action_strength("r_down_1") == 1:
				return states.RUN
				
			if Input.get_action_strength("r_right_1") == 1:
				parent.turn(false)
				return states.RUN
				
			if Input.get_action_strength("r_left_1") == 1:
				parent.turn(true)
				return states.RUN
				
			if parent.velocity.x > 0 and state == states.IDLE:
				parent.velocity.x += -parent.TRACTION*1
				parent.velocity.x = clampf(parent.velocity.x,0,parent.velocity.x)
			elif parent.velocity.x < 0 and state == states.IDLE:
				parent.velocity.x += parent.TRACTION*1
				parent.velocity.x = clampf(parent.velocity.x,parent.velocity.x,0)
				
			if parent.velocity.y > 0 and state == states.IDLE:
				parent.velocity.y += -parent.TRACTION*1
				parent.velocity.y = clampf(parent.velocity.y,0,parent.velocity.y)
			elif parent.velocity.y < 0 and state == states.IDLE:
				parent.velocity.y += parent.TRACTION*1
				parent.velocity.y = clampf(parent.velocity.y,parent.velocity.y,0)
			
		states.WALK:
			pass
		states.RUN:
			parent.get_input()
			return states.IDLE
			pass	
		states.CROUCH:
			pass
		states.HIGHBLOCK:
			pass
		states.LOWBLOCK:
			pass
		states.HIGHATTACK:
			pass
		states.LOWATTACK:
			pass
		states.DODGE:
			pass
		states.AERIAL:
			pass
		
	
func enter_state(new_state, old_state):
	match new_state:
		states.IDLE:
			parent.play_animation('Ape_Idle')
		states.RUN:
			parent.play_animation('Ape_Walk')


func exit_state(new_state, old_state):
	pass

func state_includes(state_array):
	for each_state in state_array:
		if state == each_state:
			return true
	return false
