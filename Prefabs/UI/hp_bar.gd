class_name HPBar extends Node2D

@export var hp_1: Sprite2D
@export var hp_0: Sprite2D
@export var hp_3: Sprite2D
@export var hp_2: Sprite2D
@export var hp_5: Sprite2D
@export var hp_4: Sprite2D

var hp_hearts: Array[Sprite2D] = []

func _ready() -> void:
	hp_hearts = [hp_0, hp_1, hp_2, hp_3, hp_4, hp_5]

# Set hp on a bar with a bit terrifying code implementation
func render(hp: int) -> void:
	if hp == 6:
		for i in hp_hearts:
			i.hide()
		return
	if hp == 0:
		for i in hp_hearts:
			i.show()
		return
	if hp == 5:
		hp_5.show()
		return
	if hp <= 4:
		hp_4.show()
	if hp == 3:
		hp_3.show()
		return
	if hp <= 2:
		hp_2.show()
	if hp == 1:
		hp_1.show()
