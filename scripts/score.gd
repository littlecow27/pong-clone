extends RichTextLabel

var score
var highScore

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0
	highScore = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "  High Score: "+str(highScore)+"\n  Score: "+str(score)
	if score > highScore:
		highScore = score

func _on_back_wall_score_up() -> void:
	score += 1



func _on_boundary_game_lost() -> void:
	score = 0
