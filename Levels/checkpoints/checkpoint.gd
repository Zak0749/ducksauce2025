extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var labelShow = 0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if labelShow > 0:
		$Label.visible = true
		labelShow -= 1
	else:
		$Label.visible = false

func showTheLabel():
	labelShow = 100;
