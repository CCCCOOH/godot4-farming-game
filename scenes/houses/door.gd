extends StaticBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


@onready var interactable_component: Area2D = $InteractableComponent
func _ready() -> void:
	interactable_component.body_entered.connect  (_on_entered)
	interactable_component.body_exited.connect(_on_exited)
	animated_sprite_2d.animation_finished.connect(_set_door_collision_disabled)
func _on_entered(_area) -> void:
	print(_area)
	animated_sprite_2d.play("open")

func _on_exited(_area) -> void:
	animated_sprite_2d.play("close")
	call_deferred("_unset_door_collision_disabled")

func _set_door_collision_disabled() -> void:
	collision_shape_2d.disabled = true
func _unset_door_collision_disabled() -> void:
	collision_shape_2d.disabled = false
