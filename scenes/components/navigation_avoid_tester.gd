class_name Ant extends CharacterBody2D
var player:Player
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
const SPEED: float = 50

func _ready() -> void:
	navigation_agent_2d.velocity_computed.connect(_on_velocity_computed)
	navigation_agent_2d.navigation_finished.connect(_on_nav_finished)

func _physics_process(_delta: float) -> void:
	navigation_agent_2d.target_position = player.global_position
	var next_pos = navigation_agent_2d.get_next_path_position()
	navigation_agent_2d.velocity = global_position.direction_to(next_pos).normalized() * SPEED
	

func _on_nav_finished() -> void:
	velocity = Vector2.ZERO
	move_and_slide()

func _on_velocity_computed(computed_velocity: Vector2) -> void:
	velocity = computed_velocity
	move_and_slide()
