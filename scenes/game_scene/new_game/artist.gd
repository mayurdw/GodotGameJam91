extends Area2D
class_name Artist

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

signal enemy_contact

func _ready() -> void:
	animation_player.play("rest")

func on_success() -> void:
	animation_player.play("success")
	animation_player.queue("rest")

func _on_area_entered(_area: Area2D) -> void:
	if timer.is_stopped():
		enemy_contact.emit()
		animation_player.play("theft")
		animation_player.queue("rest")
		timer.start()
