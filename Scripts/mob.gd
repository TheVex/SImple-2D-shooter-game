class_name Mob extends CharacterBody2D

signal destroyed;

var speed = 80;
var health = 20.0;
var direction = Vector2();

func _ready() -> void:
	add_to_group("mobs");

func _physics_process(delta: float) -> void:
	position += direction * speed * delta;

func get_health() -> float:
	return health;

# Decrease health when get damage
func change_health(amount: float, knockback: float) -> void:
	health -= amount;
	if health <= 0:
		emit_signal("destroyed");
		queue_free();
	position -= transform.x * knockback;
		
