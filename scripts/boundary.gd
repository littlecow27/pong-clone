extends Area2D

@export var playerGoal = 1

signal game_reset(player: int)

func _on_area_entered(area: Area2D) -> void:
	print("oh no!");
	emit_signal("game_reset", playerGoal)
	
