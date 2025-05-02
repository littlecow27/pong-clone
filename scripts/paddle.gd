extends Node2D

@export var speed = 250.0
var screen_size
@export var player_num = 1

func _ready() -> void:
	screen_size = get_viewport_rect().size
	
func _process(delta: float) -> void:
	var direction := Vector2.ZERO
	if(player_num == 1):
		if Input.is_action_pressed("Down_P1"):
			direction.y += 1
		if Input.is_action_pressed("Up_P1"):
			direction.y -= 1
	elif(player_num == 2):
		if Input.is_action_pressed("Down_P2"):
			direction.y += 1
		if Input.is_action_pressed("Up_P2"):
			direction.y -= 1 
	
	if position.y + direction.y * 3*speed * delta <= screen_size[1]-$CollisionShape2D.shape.size.y/2 and position.y + direction.y * 3*speed * delta >= $CollisionShape2D.shape.size.y/2:
		position += direction * 3*speed * delta
	elif position.y + direction.y * 3*speed * delta > screen_size[1]-$CollisionShape2D.shape.size.y/2:
		position.y = screen_size[1]-$CollisionShape2D.shape.size.y/2
	elif position.y + direction.y * 3*speed * delta < $CollisionShape2D.shape.size.y/2:
		position.y = $CollisionShape2D.shape.size.y/2

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("collision detected")
