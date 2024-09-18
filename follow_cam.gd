extends Camera2D

@export var tilemap: TileMap
@export var follow_node: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = scene_manager.player
	follow_node = player
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.cell_quadrant_size
	var worldSizeInPixels = mapRect.size * tileSize
	limit_right=worldSizeInPixels.x
	limit_bottom=worldSizeInPixels.y
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = follow_node.global_position
