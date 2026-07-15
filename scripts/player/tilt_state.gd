extends State
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@export var player: Player
@onready var hit_box: HitBox = $"../../HitBox"
@onready var collision_shape_2d: CollisionShape2D = $"../../HitBox/CollisionShape2D"

func _ready() -> void:
	animated_sprite_2d.animation_finished.connect(_emit_to_idle)
func enter() -> void:
	var dir = player.last_direction
	Utils.direction_and_play_animate(animated_sprite_2d, dir, DataType.AnimateTypes.CHOP)

func _emit_to_idle() -> void:
	transition_state.emit("IdleState")
func process(_delta: float) -> void:
	if GameInputEvents.is_hit():
		hit_box.current_tool = player.tool
		collision_shape_2d.disabled = false

func exit() -> void:
	collision_shape_2d.disabled = true
