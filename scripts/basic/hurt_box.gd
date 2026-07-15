class_name HurtBox extends Area2D
signal hurt(damage: int)
@export var hurt_tool:DataType.Tools
@export var health: int

func _ready() -> void:
	hurt.connect(_on_hurt)

func _on_hurt(_damage) -> void:
	health -= _damage
