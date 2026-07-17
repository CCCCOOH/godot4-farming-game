class_name StateInfoLabel extends Label
@export var state_machine: StateMachine
const disabled: bool = false

func _ready() -> void:
	state_machine.state_changed.connect(_on_state_changed)
	visible = not disabled
func _on_state_changed(new_state: State) -> void:
	text = new_state.name
