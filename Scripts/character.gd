class_name MainCharacter extends Area2D

@export var weapon_scene: PackedScene;

@export var animated_sprite_2d: AnimatedSprite2D;

@onready var game_manager: Node2D = $"../GameManager"

signal is_dead;

var SCREEN_WIDTH;
var x_offset = 20;

var weapon: Weapon; 

var is_cooldown = false;
var cooldown_time = 0.3;
var can_shoot = false;

var initial_position;
var shoot_position;
var mouse_position;

# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	weapon = weapon_scene.instantiate();
	
	SCREEN_WIDTH = get_viewport().get_visible_rect().size.x;
	#global_position.x = SCREEN_WIDTH / 2 + x_offset;
	
	initial_position = animated_sprite_2d.position;
	shoot_position = animated_sprite_2d.position + Vector2(25, 0);
	
	weapon.weapon_reload.connect(func(): can_shoot = false);
	weapon.weapon_shoot.connect(func(): can_shoot = false);
	weapon.weapon_reload_finished.connect(func(): can_shoot = true);
	weapon.weapon_shoot_finished.connect(func(): can_shoot = true);


# Make shoot actions based on mob which was hit by mouse
func shoot(mob: Mob) -> void:
	if (!can_shoot):
		return;
		
	mouse_position = get_viewport().get_mouse_position();
	if mouse_position.x < SCREEN_WIDTH / 2:
		scale.x = -abs(scale.x);
	else:
		scale.x = abs(scale.x);
	animated_sprite_2d.play("shoot");
	animated_sprite_2d.position = shoot_position;
	
	mob.apply_knockback(weapon.get_knockback())
	mob.change_health(weapon.get_damage(), false)
	print("MOB HEALTH: " + var_to_str(mob.health))


# Check whenever mob touched character
func _on_body_entered(body: Node2D) -> void:
	if body is Mob:
		emit_signal("is_dead");
		queue_free();

#
func _on_animated_sprite_2d_animation_finished() -> void:
	print(animated_sprite_2d.animation)
	if (animated_sprite_2d.animation == "shoot"):
		animated_sprite_2d.play("idle");
		animated_sprite_2d.position = initial_position;
