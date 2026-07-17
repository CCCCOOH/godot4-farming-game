extends Camera2D
@onready var player: CharacterBody2D

func _ready() -> void:
	player = get_parent().find_child("Player")
	position = player.position

func _process(_delta: float) -> void:
	position = player.position


func _on_timer_timeout() -> void:
	pass # Replace with function body.
