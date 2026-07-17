class_name NPCIdleState extends State
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
var idle_duration: float
@export var MAX_IDLE_DURATION: float

func enter() -> void:
	animated_sprite_2d.play("idle")
	idle_duration = MAX_IDLE_DURATION * randf()
	await get_tree().create_timer(idle_duration).timeout
	transition_state.emit("WalkState")
