extends Marker2D
var chicken_scene = preload("res://scenes/NPC/chicken/chicken.tscn")
@onready var player: Player = $"../Player"
func _ready() -> void:
	call_deferred("spawn_chickens")
	
func spawn_chickens() -> void:
	for i in range(50):
		var chicken = chicken_scene.instantiate() as NPC
		chicken.global_position = global_position
		get_parent().add_child(chicken)
