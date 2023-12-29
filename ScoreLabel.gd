extends RichTextLabel

@export var ScoreText : RichTextLabel;
@export var scoreKeeper : ScoreDisplay;

func _process(_delta) -> void:
	print("Changing the score text.")
	ScoreText.text = ("Score "+str(scoreKeeper.score))
