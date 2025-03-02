extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass	
	
func fade_animation() -> void:
	print("playing")
	self.play('fade_in') # Replace with function body.
	#await get_tree().create_timer(0.5).timeout
	print("done")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
