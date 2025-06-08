extends Control
 
@export var start: Button;
@export var exit: Button;

func _ready():
	start.pressed.connect(_on_start_pressed);
	exit.pressed.connect(_on_exit_pressed);
	
# For button "START"
func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
	
# For button "EXIT"
func _on_exit_pressed():
	get_tree().quit()
