extends RichTextLabel


func _process(delta):
	Score Label.text("Score " + score)