extends RichTextLabel

var P1_Score
var P2_Score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	P1_Score = 0
	P2_Score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "[center]"+str(P1_Score)+"-"+str(P2_Score)


func _on_boundary_game_reset(player: int) -> void:
	if player == 1:
		P1_Score += 1
	elif player == 2:
		P2_Score += 1
