extends Area2D

@export var move_speed: float = 30.0
@export var move_direction: Vector2

var start_position: Vector2
var target_position: Vector2

func _ready() -> void:
	start_position = global_position
	target_position = start_position + move_direction

func _process(delta: float) -> void:
	global_position = global_position.move_toward(target_position, move_speed * delta)

	# move back and forth between start_position and target_position
	if global_position == target_position:
		if global_position == start_position:
			target_position = start_position + move_direction
		else:
			target_position = start_position

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.game_over()
