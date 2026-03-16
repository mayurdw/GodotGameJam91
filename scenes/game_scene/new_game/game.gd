extends Node2D

@onready var treasure: Marker2D = $Treasure
@onready var defender: Area2D = $Treasure/Defender
@onready var rest_timer: Timer = $"Rest Timer"
@onready var attack_timer: Timer = $"Attack Timer"

@export var rest_time : float = 1.5
@export var attack_time : float = 1.5

var movement_speed : int = 3

func _ready() -> void:
	rest_timer.start(rest_time)

func _on_timer_timeout() -> void:
	defender.attack()
	attack_timer.start(attack_time)
	
func _physics_process(delta: float) -> void:
	treasure.rotation += -1.0 * movement_speed * delta


func _on_attack_timer_timeout() -> void:
	defender.rest()
	rest_timer.start(rest_time)
