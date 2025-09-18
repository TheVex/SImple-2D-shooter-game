class_name Bullet extends Area2D

var damage: int;
var knockback: int;
var lifetime: int = 1;

@onready var timer: Timer = $Timer

func _ready() -> void:
	# Configuring timer till end of bullet existence
	timer.timeout.connect(func(): queue_free())
	timer.wait_time = lifetime;
	timer.start()

func set_values(d: int, kb: int):
	damage = d;
	knockback = kb;

# When collides with object
func _on_body_entered(body: Node2D) -> void:
	# If object is mob, deal damage to him and delete bullet
	if body is Mob and !body.on_death:
		body.apply_knockback(knockback)
		body.change_health(damage, false);
		queue_free();
