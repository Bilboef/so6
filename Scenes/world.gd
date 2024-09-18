extends BaseScene

@onready var camera = $follow_cam

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	camera.follow_node = player
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
