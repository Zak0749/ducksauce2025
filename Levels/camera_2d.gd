extends Camera2D

@export var player: Node2D  # Drag your player node into this
@export var smoothing_speed: float = 5.0

func _ready():
	print("camera setup")
	position = player.position
	
	force_update_scroll()
	reset_smoothing()
	

func _process(delta):		
	var h = self.get_viewport().size.y / 1200.0
	self.zoom = Vector2(h, h)

	# Smoothly follow player on X-axis
	position.x = lerp(position.x, player.position.x, 0.1)
	position.y = lerp(position.y, player.position.y, 0.1)
