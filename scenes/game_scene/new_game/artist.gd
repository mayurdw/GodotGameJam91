extends StaticBody2D
class_name Artist

@onready var timer: Timer = $Timer

signal enemy_contact

func _on_timer_timeout() -> void:
	pass

func _on_body_entered(body: Node) -> void:
	if timer.is_stopped():
		enemy_contact.emit()
		timer.start()
