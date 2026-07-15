class_name GameInputEvents

static func movement_input() -> Vector2:
	var direction = Vector2.ZERO
	if Input.is_action_pressed("left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("right"):
		direction = Vector2.RIGHT
	elif Input.is_action_pressed("up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("down"):
		direction = Vector2.DOWN
	return direction
static func is_movement() -> bool:
	var dir = movement_input()
	if dir:
		return true
	else:
		return false

static func is_hit() -> bool:
	return Input.is_action_just_pressed("hit")
