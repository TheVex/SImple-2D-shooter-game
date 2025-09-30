class_name MainCharacter extends Area2D

@export var hp: int;
@export var hp_loss_cooldown: float;

@export var weapon_scene: PackedScene;
@export var character_sprite: AnimatedSprite2D;
@export var hp_cooldown_timer: Timer;

@onready var game_manager: Node2D = $"../GameManager"
@onready var bullet_scene = preload("res://Prefabs/Weapons/bullet.tscn")

signal lost_hp;
signal is_dead;
signal update_ammo_ui(ammo: int, capacity: int, is_reload: bool)


var SCREEN_WIDTH;
var x_offset = 20;

var can_lose_hp = true;

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
	owner.add_child.call_deferred(weapon);
	weapon._ready();
	
	SCREEN_WIDTH = get_viewport().get_visible_rect().size.x;
	#global_position.x = SCREEN_WIDTH / 2 + x_offset;
	
	initial_position = character_sprite.position;
	shoot_position = character_sprite.position + Vector2(25, 0);
	
	hp_cooldown_timer.timeout.connect(on_hp_cooldown_finished);
	hp_cooldown_timer.wait_time = hp_loss_cooldown;
	
	weapon.weapon_reload.connect(_on_weapon_reload);
	weapon.weapon_shoot.connect(_on_weapon_shoot);
	weapon.weapon_reload_finished.connect(_on_weapon_reload_finished);
	weapon.weapon_shoot_finished.connect(_on_weapon_shoot_finished);


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
	if (weapon.shoot_timer.time_left > 0 or weapon.reload_timer.time_left > 0):
		can_shoot = false
	else:
		can_shoot = true


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

# When weapon starts to reload
func _on_weapon_reload():
	can_shoot = false;
	update_ammo_ui.emit(weapon.get_ammo(), weapon.get_max_capacity(), true);

# When weapon shot
func _on_weapon_shoot():
	can_shoot = false;
	update_ammo_ui.emit(weapon.get_ammo(), weapon.get_max_capacity(), false);
	
# When weapon finishes its reloading
func _on_weapon_reload_finished():
	can_shoot = true;
	update_ammo_ui.emit(weapon.get_ammo(), weapon.get_max_capacity(), false);

# When cooldown from shot is out
func _on_weapon_shoot_finished():
	can_shoot = true;

func on_hp_cooldown_finished():
	can_lose_hp = true;
	
# Check whenever mob touched character
func _on_body_entered(body: Node2D) -> void:
	if not can_lose_hp:
		return
	if body is Mob:
		hp -= 1;
		emit_signal("lost_hp");
		if hp == 0:
			emit_signal("is_dead");
			queue_free();
		else:
			can_lose_hp = false;
			hp_cooldown_timer.start();

func _on_character_sprite_animation_finished() -> void:
	if (character_sprite.animation == "shoot"):
		character_sprite.play("idle");
		character_sprite.position = initial_position;

func get_hp():
	return hp;
