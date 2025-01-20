extends Node2D

signal shop_activated;
signal shop_exited;

@onready var shop_button: Button = $Control/ShopButton
@onready var exit_button: Button = $Control/ExitButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shop_button.pressed.connect(_on_shop_button_pressed);
	exit_button.pressed.connect(_on_exit_button_pressed);

func _on_shop_button_pressed() -> void:
	emit_signal("shop_activated");

func _on_exit_button_pressed() -> void:
	emit_signal("shop_exited");
