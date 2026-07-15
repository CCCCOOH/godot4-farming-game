class_name Log extends Sprite2D
@onready var collect_component: CollectComponent = $CollectComponent
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	collect_component.collected.connect(_on_collected)

func _on_collected() -> void:
	animation_player.play("die")
