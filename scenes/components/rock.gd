extends StaticBody2D
@onready var hurt_box: Area2D = $HurtBox
@export var sprite_2d: Sprite2D
var rock_collect_scene = preload("res://scenes/components/rock_collect.tscn")

func _ready() -> void:
	hurt_box.hurt.connect(_on_hurt)

# 不能在遍历碰撞area的函数中添加对象，会导致报错提示
func _on_hurt(_damage) -> void:
	var material = sprite_2d.material as ShaderMaterial
	material.set_shader_parameter("intensity", 1.0)
	await get_tree().create_timer(.5).timeout
	material.set_shader_parameter("intensity", 0.0)
	if (hurt_box.health <= 0):
		_die_and_spawn_log.call_deferred()

func _die_and_spawn_log() -> void:
	var rock_collect:RockCollect = rock_collect_scene.instantiate()
	rock_collect.global_position = global_position
	get_parent().add_child(rock_collect)
	queue_free()
