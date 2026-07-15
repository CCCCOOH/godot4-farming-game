extends State
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@export var SPEED:int
@export var player:Player
@onready var hit_box: Area2D = $"../../HitBox"

enum MoveToward {
	left,
	right,
	up,
	down
}
var last_move: MoveToward

func physics_process(_delta: float) -> void:
	var direction = GameInputEvents.movement_input()
	player.velocity = direction * SPEED
	player.move_and_slide()
	Utils.direction_and_play_animate(animated_sprite_2d, direction, DataType.AnimateTypes.WALK)
	if GameInputEvents.is_movement():
		player.last_direction = direction
	else:
		transition_state.emit("IdleState")
