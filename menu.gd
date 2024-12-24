extends Control

@onready var start: Button = $Container/Start;
@onready var exit: Button = $Container/Exit;

func _ready():
	start.pressed.connect(_on_start_pressed);
	exit.pressed.connect(_on_exit_pressed);
	
	
func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
	
# Обработчик для кнопки "Exit"
func _on_exit_pressed():
	get_tree().quit()
