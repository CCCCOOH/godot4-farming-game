extends State
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@export var player: Player

func _ready() -> void:
	animated_sprite_2d.animation_finished.connect(_emit_to_idle)
func enter() -> void:
	var dir = player.last_direction
	Utils.direction_and_play_animate(animated_sprite_2d, dir, DataType.AnimateTypes.CHOP)
	
func _emit_to_idle() -> void:
	transition_state.emit("IdleState")
