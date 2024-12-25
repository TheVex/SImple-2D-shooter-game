class_name Mob extends CharacterBody2D

signal destroyed;

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var speed = 80;
var health = 20.0;
var direction = Vector2();
var on_death = false;
func _ready() -> void:
	add_to_group("mobs");

func _physics_process(delta: float) -> void:
	position += direction * speed * delta;

func get_health() -> float:
	return health;

# Decrease health when get damage
func change_health(amount: float, knockback: float) -> void:
	if !on_death:
		health -= amount;
		if health <= 0:
			die();
		else:
			position -= transform.x * knockback;
		
func die():
	on_death = true;
	emit_signal("destroyed");
	direction = Vector2();
	collision_shape_2d.disabled = true;
	animated_sprite_2d.play("death");

func _on_animation_finished() -> void:
	if animated_sprite_2d.animation == "death":
		await get_tree().create_timer(2).timeout;
		queue_free();
