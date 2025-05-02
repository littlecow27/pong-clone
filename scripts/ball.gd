extends Node2D
	
var dirX = 1
var dirY = 1
const STARTPOSX = 480
var startPosY
@export var speed = 200.0
var screen_size
var ball_moving

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	startGame()
	
	

func startGame() -> void:
	ball_moving = false
	$StartTimer.start(1)
	position.x = STARTPOSX
	position.y = randi_range(20, 230)
	if randi() % 2 == 0:
		dirY = -1
	else:
		dirY = 1
	
	if randi() % 2 == 0:
		dirX = -1
	else:
		dirX = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ball_moving:
		var direction := Vector2.ZERO
		
		direction.x = dirX
		direction.y = dirY
		if position.y + direction.y * 3 * speed * delta < screen_size[1]-20 and position.y + direction.y * 3 * speed * delta > 20:
			position += direction * 3*speed * delta
		else:
			dirY = -dirY

func _on_area_2d_body_entered(body: Node2D) -> void:
	dirX = -dirX

func _on_start_timer_timeout() -> void:
	ball_moving = true


func _on_boundary_game_reset(player: int) -> void:
	startGame()
