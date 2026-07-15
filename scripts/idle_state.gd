extends State
@onready var animate: AnimatedSprite2D = $"../../AnimatedSprite2D"
@export var player:Player

func physics_process(_delta: float) -> void:
	var direction = player.last_direction
	Utils.direction_and_play_animate(animate, direction, DataType.AnimateTypes.IDLE)
	# 进入移动状态
	if GameInputEvents.is_movement():
		transition_state.emit("WalkState")
	if GameInputEvents.is_hit():
		if player.tool and player.tool == DataType.Tools.AxeWood:
			transition_state.emit("ChoppingState")
		elif player.tool and player.tool == DataType.Tools.TillGound:
			transition_state.emit("TillingState")
		elif player.tool and player.tool == DataType.Tools.WaterCrops:
			transition_state.emit("WateringState")
