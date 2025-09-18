class_name MainCharacter extends Area2D

@export var weapon_scene: PackedScene;

@export var character_sprite: AnimatedSprite2D;

@onready var game_manager: Node2D = $"../GameManager"

@onready var bullet_scene = preload("res://Prefabs/Weapons/bullet.tscn")
signal is_dead;

var SCREEN_WIDTH;
var x_offset = 20;

var weapon: Weapon; 
# Controlled by character and weapon
var can_shoot: bool = false;
# Controlled by game manager
var can_shoot_enforced: bool = false;
var initial_position;
var shoot_position;
var mouse_position;

# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	weapon = weapon_scene.instantiate();
	owner.add_child.call_deferred(weapon)
	weapon._ready()
	
	SCREEN_WIDTH = get_viewport().get_visible_rect().size.x;
	#global_position.x = SCREEN_WIDTH / 2 + x_offset;
	
	initial_position = character_sprite.position;
	shoot_position = character_sprite.position + Vector2(25, 0);
	
	weapon.weapon_reload.connect(func(): can_shoot = false);
	weapon.weapon_shoot.connect(func(): can_shoot = false);
	weapon.weapon_reload_finished.connect(func(): can_shoot = true);
	weapon.weapon_shoot_finished.connect(func(): can_shoot = true);


func _process(delta: float) -> void:
	if (weapon.shoot_timer.time_left > 0 or weapon.reload_timer.time_left > 0):
		can_shoot = false
	else:
		can_shoot = true
		

func _input(event) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			shoot()

# Make shoot actions based on mob which was hit by mouse
func shoot() -> void:
	if !can_shoot or !can_shoot_enforced:
		return
		
	mouse_position = get_viewport().get_mouse_position();
	if mouse_position.x < SCREEN_WIDTH / 2:
		scale.x = -abs(scale.x);
	else:
		scale.x = abs(scale.x);
	character_sprite.play("shoot");
	character_sprite.position = shoot_position;
	
	weapon.fix_shot()
	var bullet = bullet_scene.instantiate()
	bullet.set_values(weapon.damage, weapon.bullet_knockback)
	bullet.position = mouse_position;
	owner.add_child(bullet)
	

# Check whenever mob touched character
func _on_body_entered(body: Node2D) -> void:
	if body is Mob:
		emit_signal("is_dead");
		queue_free();

#
func _on_character_sprite_animation_finished() -> void:
	if (character_sprite.animation == "shoot"):
		character_sprite.play("idle");
		character_sprite.position = initial_position;
