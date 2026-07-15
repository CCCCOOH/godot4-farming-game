class_name Utils

static func direction_and_play_animate(animated_sprite_2d: AnimatedSprite2D, direction: Vector2, animateType: DataType.AnimateTypes) -> void:
	var suffix
	match animateType:
		DataType.AnimateTypes.IDLE:
			suffix = 'idle'
		DataType.AnimateTypes.CHOP:
			suffix = 'chopping'
		DataType.AnimateTypes.WALK:
			suffix = 'walk'
		DataType.AnimateTypes.TILT:
			suffix = 'tilling'
		DataType.AnimateTypes.WATER:
			suffix = 'watering'
			
	if direction == Vector2.LEFT:
		animated_sprite_2d.play("%s_left" % suffix)
	elif direction == Vector2.UP:
		animated_sprite_2d.play("%s_back" % suffix)
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("%s_front" % suffix)
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("%s_right" % suffix)
