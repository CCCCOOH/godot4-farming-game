extends HitBox
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var player: Player = $".."
@onready var up: Marker2D = $UP
@onready var down: Marker2D = $DOWN
@onready var left: Marker2D = $LEFT
@onready var right: Marker2D = $RIGHT

func _physics_process(delta: float) -> void:
	var len: int = 0
	match player.last_direction:
		Vector2.UP:
			position = up.position
		Vector2.DOWN:
			position = down.position
		Vector2.LEFT:
			position = left.position
		Vector2.RIGHT:
			position = right.position
