class_name Counter extends Node2D

@export var counter_length: int;

func render(number: int) -> void:
	var n = str(number);
	while n.length() < counter_length:
		n = "0" + n;
	for i in range(counter_length):
		get_node(str(i)).texture = load("res://Assets/menu/counters&buttons/numbers/{digit}.png".format({"digit": n[i]}));
		
