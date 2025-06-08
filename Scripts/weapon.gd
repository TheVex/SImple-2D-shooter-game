class_name Weapon extends Node

@export var damage: float; 
@export var bullet_knockback: float;
@export var shoot_cooldown: float;
@export var weapon_name: String;
@export var reload_cooldown: int;
@export var max_magazine_capacity: int;

@onready var reload_timer: Timer = $ReloadTimer
@onready var shoot_timer: Timer = $ShootTimer

var current_magazine_capacity;

signal weapon_reload;
signal weapon_shoot;
signal weapon_reload_finished();
signal weapon_shoot_finished();

func _ready() -> void:
	current_magazine_capacity = max_magazine_capacity;
	
	# Initializing timers
	reload_timer.timeout.connect(func(): 	current_magazine_capacity = max_magazine_capacity, 
											emit_signal("weapon_reload_finished"));
	reload_timer.wait_time = reload_cooldown;
	shoot_timer.timeout.connect(func(): emit_signal("weapon_shoot_finished"));
	shoot_timer.wait_time = shoot_cooldown;


func _input(event: InputEvent) -> void:
	if (event.is_action_just_pressed('shoot')):
		print("SHOOTING")
		shoot();
		

func shoot() -> void:
	# if magazine is empty
	if current_magazine_capacity == 0:
		return;
		
	current_magazine_capacity -= 1;
	print("CAPACITY: " + current_magazine_capacity)
	# Check magazine condition
	if current_magazine_capacity == 0:
		emit_signal("weapon_reload");
		reload_timer.start()
	elif current_magazine_capacity > 0:
		emit_signal("weapon_shoot")
		shoot_timer.start()
	else:
		print("Weapon error: " + weapon_name + " has negative magazine capacity.")


func get_knockback() -> float:
	return bullet_knockback;


func get_damage() -> float:
	return damage;
