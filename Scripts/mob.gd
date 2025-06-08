class_name Mob extends CharacterBody2D

signal destroyed(money: int);
signal mob_damaged(mob: Mob);

@export var animated_sprite_2d: AnimatedSprite2D;
@export var collision_shape_2d: CollisionShape2D;

@export var speed: int;
@export var push_multiplier: int;
@export var health: float;
@export var reward: int;

var direction = Vector2();
var on_death = false;
var mouse_on = true;

func _ready() -> void:
	input_pickable = true;
	

func _physics_process(delta: float) -> void:
	position += direction * speed * delta;


func get_health() -> float:
	return health;


func apply_knockback(knockback: float) -> void:
	position -= direction * knockback;
	

# Decrease health when get damage
func change_health(amount: float, heal: bool) -> void:
	if !on_death:
		if heal:
			health += amount;
		else:
			health -= amount;
		if health <= 0:
			die();


func die():
	on_death = true;
	emit_signal("destroyed", reward);
	direction = Vector2();
	collision_shape_2d.set_deferred("disabled", true);
	animated_sprite_2d.play("death");


func _on_animation_finished() -> void:
	if animated_sprite_2d.animation == "death":
		await get_tree().create_timer(2).timeout;
		queue_free();


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (Input.is_action_just_pressed("shoot")):
		emit_signal("mob_damaged", self);
