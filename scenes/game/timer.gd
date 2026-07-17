extends Timer
var ant_scene = preload("res://scenes/components/navigation_avoid_tester.tscn")
@onready var player: Player = $"../Player"

func _on_timeout() -> void:
	for i in range(50):
		var ant = ant_scene.instantiate() as Ant
		ant.global_position = player.global_position
		ant.player = player
		player.get_parent().add_child(ant)
