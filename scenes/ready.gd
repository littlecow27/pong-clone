extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start(1)

func _on_timer_timeout() -> void:
	self_modulate.a = 0

func _on_boundary_game_lost() -> void:
	self_modulate.a = 1
	$Timer.start(1)
