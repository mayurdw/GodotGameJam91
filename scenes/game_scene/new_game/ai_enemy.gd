extends Area2D
class_name AI_Enemy

@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer

@export var direction : Vector2 = Vector2.RIGHT
@export var speed : float = 100.0
@export var moving : bool = true

func _physics_process(delta: float) -> void:
	if moving:
		position += speed * direction * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	call_deferred("queue_free")

func queue_death() -> void:
	animation_player.play("death")

func _on_area_entered(area: Area2D) -> void:
	if area is Artist:
		moving = false
		timer.start()

func _on_timer_timeout() -> void:
	speed *= -1.0
	moving = true
