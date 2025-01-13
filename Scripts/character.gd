extends Area2D

@export var Bullet : PackedScene
@onready var cooldown = $WeaponCooldown
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

signal is_dead

var SCREEN_WIDTH;
var x_offset = 20;

var speed = 500;

var is_cooldown = false;
var cooldown_time = 0.3;
var can_shoot = false;

var initial_position;
var shoot_position;
var mouse_position;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	SCREEN_WIDTH = get_viewport().get_visible_rect().size.x;
	#global_position.x = SCREEN_WIDTH / 2 + x_offset;
	
	initial_position = animated_sprite_2d.position;
	shoot_position = animated_sprite_2d.position + Vector2(25, 0);
	
	cooldown.timeout.connect(_on_timer_timeout);
	cooldown.wait_time = cooldown_time;

func _on_timer_timeout():
	is_cooldown = false;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (Input.is_action_pressed("shoot") and can_shoot and !is_cooldown):
		mouse_position = get_viewport().get_mouse_position();
		if mouse_position.x < SCREEN_WIDTH / 2:
			scale.x = -abs(scale.x);
		else:
			scale.x = abs(scale.x);
		animated_sprite_2d.play("shoot");
		animated_sprite_2d.position = shoot_position;

# Shoot from some weapon
func shoot() -> void:
	var bullet = Bullet.instantiate();
	var direction = (mouse_position - $Muzzle.global_position).normalized();
	owner.add_child(bullet);
	bullet.transform = $Muzzle.global_transform;

	bullet.direction = direction;
	is_cooldown = true;
	cooldown.start()
	



func _on_body_entered(body: Node2D) -> void:
	if body is Mob:
		emit_signal("is_dead");
		queue_free();


func _on_animated_sprite_2d_animation_finished() -> void:
	print(animated_sprite_2d.animation)
	if (animated_sprite_2d.animation == "shoot"):
		shoot();
		animated_sprite_2d.play("idle");
		animated_sprite_2d.position = initial_position;
