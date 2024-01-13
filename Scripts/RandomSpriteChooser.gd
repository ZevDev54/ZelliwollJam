extends Sprite2D

@export var spriteList : Array[Texture2D]


func _ready():
	var spriteIndex = randi_range(0, spriteList.size() - 1);
	texture = spriteList[spriteIndex];

