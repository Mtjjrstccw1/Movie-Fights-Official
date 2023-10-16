extends StateMachine
var id = 1

func _ready():
	add_state("IDLE")
	add_state("JUMP")
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

	match state:
		states.IDLE:
			pass
		states.JUMP:
			pass
		states.WALK:
			pass
		states.RUN:
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
	pass

func exit_state(new_state, old_state):
	pass

func state_includes(state_array):
	for each_state in state_array:
		if state == each_state:
			return true
	return false
