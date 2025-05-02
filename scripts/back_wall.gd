extends Node2D

signal scoreUp

func _on_area_entered(area: Area2D) -> void:
	scoreUp.emit()
