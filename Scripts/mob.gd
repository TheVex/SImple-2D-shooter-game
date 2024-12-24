class_name Mob extends CharacterBody2D

signal destroyed;

var speed = 100;
var health = 40.0;

func _ready() -> void:
	add_to_group("mobs");

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta;

func get_health() -> float:
	return health;

func change_health(amount: float, knockback: float) -> void:
	health -= amount;
	if health <= 0:
		emit_signal("destroyed");
		queue_free();
	position -= transform.x * knockback;
		
