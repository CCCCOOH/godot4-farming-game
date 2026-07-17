class_name NPCWalkState extends State

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var navigation_agent_2d: NavigationAgent2D = $"../../NavigationAgent2D"
@onready var area_2d: Area2D = $"../../Area2D"
@onready var npc:NPC = $"../.."

func _ready() -> void:
	navigation_agent_2d.navigation_finished.connect(_on_nav_finished)
	navigation_agent_2d.velocity_computed.connect(_on_velocity_computed)
	area_2d.body_entered.connect(_on_body_entered)

func enter() -> void:
	navigation_agent_2d.avoidance_enabled = true
	animated_sprite_2d.play("walk")
	var target_point = NavigationServer2D.map_get_random_point(navigation_agent_2d.get_navigation_map(), navigation_agent_2d.navigation_layers, false)
	navigation_agent_2d.target_position = target_point

func physics_process(_delta: float) -> void:
	var target_position = navigation_agent_2d.get_next_path_position()
	var direction = npc.global_position.direction_to(target_position).normalized()
	var velocity: Vector2 = direction * npc.SPEED
	animated_sprite_2d.flip_h = direction.x < 0
	if navigation_agent_2d.avoidance_enabled:
		navigation_agent_2d.velocity = velocity
	else:
		npc.velocity = velocity
		npc.move_and_slide()

func exit() -> void:
	navigation_agent_2d.avoidance_enabled = false
	npc.velocity = Vector2.ZERO
	npc.move_and_slide()

func _on_nav_finished() -> void:
	transition_state.emit("IdleState")

func _on_velocity_computed(safe_velocity: Vector2):
	npc.velocity = safe_velocity
	npc.move_and_slide()

func _on_body_entered(body) -> void:
	if body is Player:
		transition_state.emit("IdleState")
