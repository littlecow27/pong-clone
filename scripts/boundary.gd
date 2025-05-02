extends Node2D

signal game_lost

func _on_area_entered(area: Area2D) -> void:
	game_lost.emit()
