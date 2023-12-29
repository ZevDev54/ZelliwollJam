extends RichTextLabel

@export var ScoreText : RichTextLabel;
@export var scoreKeeper : ScoreDisplay;

func _process(_delta) -> void:
	ScoreText.text = ("Score "+str(scoreKeeper.score))
