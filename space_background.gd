extends ParallaxBackground
@onready var space_layer: ParallaxLayer = $SpaceLayer
@onready var far_star_layer: ParallaxLayer = $FarStarLayer
@onready var closestar_layer: ParallaxLayer = $ClosestarLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	closestar_layer.motion_offset.y+=20*delta
	
