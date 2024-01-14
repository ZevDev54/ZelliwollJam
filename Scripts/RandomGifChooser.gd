extends AnimatedSprite2D

@export var spriteframesList : Array[SpriteFrames];

func _ready():
	var index = randi_range(0, spriteframesList.size()-1);
	sprite_frames = spriteframesList[index];
