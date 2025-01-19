extends Camera2D

@onready var target: Area2D = $"../MainCharacter"

# Screen center
var CENTER;
# Offset between target and center
var target_offset;


var standard_zoom = Vector2(1, 1)
var closer_zoom = Vector2(2, 2);

var is_zoomed = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#CENTER = get_viewport().get_visible_rect().size / 2;
	#target_offset = target.position - CENTER;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
