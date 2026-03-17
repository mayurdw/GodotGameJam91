extends Node2D

@onready var treasure: Marker2D = $Treasure
@onready var defender: Area2D = $Treasure/Defender
@onready var rest_timer: Timer = $"Rest Timer"
@onready var attack_timer: Timer = $"Attack Timer"
@onready var ai_spawner: Path2D = $"AI Spawner"
@onready var spawn_location: PathFollow2D = $"AI Spawner/Spawn Location"
@onready var mob_timer: Timer = $"Mob Timer"

@export var rest_time : float = 1.5
@export var attack_time : float = 1.5
@export var mob_scene : PackedScene = preload("res://scenes/game_scene/new_game/ai_enemy.tscn")

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

func _on_mob_timer_timeout():
		# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = spawn_location
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	mob.look_at(treasure.position)

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(mob.rotation)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
