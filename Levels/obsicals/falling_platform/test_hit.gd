extends Area2D

func start_decay():
	print("decaying")	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("connection made")
	self.connect("area_entered", start_decay)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
