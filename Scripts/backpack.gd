extends Node2D

@onready var backpack_opened: Sprite2D = $BackpackOpened
@onready var backpack_closed: Sprite2D = $BackpackClosed

var is_opened: bool = false;

func open_backpack():
	if not is_opened:
		backpack_opened.show();
		backpack_closed.hide();
		
func close_backpack():
	if is_opened:
		backpack_opened.hide();
		backpack_closed.show();
