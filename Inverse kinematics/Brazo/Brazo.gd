extends CharacterBody2D
@onready var target = $Target


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	target.position = get_global_mouse_position()
