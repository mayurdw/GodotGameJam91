extends Node2D

@onready var timer: Timer = $Timer
@onready var treasure: Marker2D = $Treasure
@onready var defender: Area2D = $Treasure/Defender

var is_attacking : bool = false
var movement_speed : int = 3

func _on_timer_timeout() -> void:
	if is_attacking:
		defender.rest()
	else:
		defender.attack()
	
	is_attacking = !is_attacking

func _physics_process(delta: float) -> void:
	var rotation_direction = Input.get_axis("move_left", "move_right")
	treasure.rotation += rotation_direction * movement_speed * delta
