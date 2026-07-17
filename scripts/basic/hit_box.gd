class_name HitBox extends Area2D

var current_tool: DataType.Tools

@warning_ignore("unused_signal")
signal hit(_damage: int)
@export var damage: int

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area) -> void:
	var hurt_box = area as HurtBox
	if current_tool == hurt_box.hurt_tool:
		hurt_box.hurt.emit(damage)
