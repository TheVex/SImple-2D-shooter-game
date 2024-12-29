class_name Mob extends CharacterBody2D

signal destroyed(money: int);

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var tween_container: Node2D = $TweenContainer

var speed = 100;
var push_multiplier = 15;
var health = 20.0;
var money = 47;
var direction = Vector2();
var on_death = false;

	
func _physics_process(delta: float) -> void:
	'''
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD);
	tween.tween_property(self, "position", position + direction * speed * push_multiplier, 0.1);
	tween.play();
	'''
	position += direction * speed * delta;

func get_health() -> float:
	return health;

# Decrease health when get damage
func change_health(amount: float, knockback: float) -> void:
	if !on_death:
		health -= amount;
		if health <= 0:
			die();
		position -= transform.x * knockback;
		
func die():
	on_death = true;
	emit_signal("destroyed", money);
	direction = Vector2();
	collision_shape_2d.set_deferred("disabled", true);
	animated_sprite_2d.play("death");

func _on_animation_finished() -> void:
	if animated_sprite_2d.animation == "death":
		await get_tree().create_timer(2).timeout;
		queue_free();
