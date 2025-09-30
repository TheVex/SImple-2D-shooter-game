extends Control
 
@export var start: Button;
@export var exit: Button;


# Initializing buttons
func _ready():
	start.pressed.connect(_on_start_pressed);
	exit.pressed.connect(_on_exit_pressed);

# Consider some inputs
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("escape"):
		_on_exit_pressed()

# For button "START"
func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
# For button "EXIT"
func _on_exit_pressed():
	get_tree().quit()
