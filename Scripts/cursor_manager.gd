class_name CursorManager extends Node2D

@export var cursor_shoot: Texture2D;
@export var size: int;

func _ready() -> void:
	Input.set_custom_mouse_cursor(adapt(cursor_shoot));
	
func adapt(cursor_texture: Texture2D) -> Image:
	var image = cursor_shoot.get_image();
	image.resize(size, size);
	return image;
