class_name Counter extends Node2D

@export var counter_length: int;

func render(number: int) -> void:
	var n = str(number);
	print(number)
	while n.length() < counter_length:
		n = "0" + n;
	print(n)
	for i in range(counter_length):
		get_node(str(i)).texture = load("res://Assets/Счетчики и кнокпки/цифры для счетчиков/{digit}.png".format({"digit": n[i]}));
		
