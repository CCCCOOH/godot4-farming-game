class_name StateMachine extends Node

var states: Dictionary[String,State]
@export var init_state:State
var current_state:State

func _ready() -> void:
	for state in get_children():
		if state is State:
			states[state.name] = state				# 初始化状态名->状态对象映射字典
			state.transition_state.connect(_on_transition_state)	# 连接过渡信号
	if init_state:
		current_state = init_state
		current_state.enter()

func _process(_delta: float) -> void:
	current_state.process(_delta)
func _physics_process(_delta: float) -> void:
	current_state.physics_process(_delta)

func _on_transition_state(new_state_name: String):
	if states.has(new_state_name):
		current_state.exit()
		current_state = states[new_state_name]
		current_state.enter()
