extends Node2D

@onready var weapon: Node2D = $Weapon
@onready var collider: CollisionShape2D = $Collider
@onready var animator: AnimationPlayer = $Animator

func _ready() -> void:
	rest()

func attack() -> void:
	animator.play("Attack")

func rest() -> void:
	animator.play("rest")


func _on_body_entered(body: Node2D) -> void:
	if body is AI_Enemy:
		body.queue_death()
