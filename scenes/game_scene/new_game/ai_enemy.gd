extends RigidBody2D
class_name AI_Enemy

@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	call_deferred("queue_free")


func _on_body_entered(body: Node) -> void:
	if body is Artist:
		pass

func queue_death() -> void:
	animation_player.play("death")
