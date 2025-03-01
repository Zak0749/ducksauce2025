extends AnimatableBody2D

func _start_decay(a):
	pass	
	
var og_height = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	og_height = self.position.y
	$Area2D.connect("area_entered", _start_decay)

var goingDoon = false
var timer = 50;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if goingDoon:
		timer = max(timer - 1, 0)
		
	if timer == 0:
		self.position.y += 5
		
	if self.position.y > 500:
		goingDoon = false
		timer = 50
		self.position.y = og_height


func _on_area_2d_body_entered(body: Node2D) -> void:
	goingDoon = true
	
		
		
