class_name Weapon extends Node

@export var damage: float; 
@export var bullet_knockback: float;
@export var shoot_cooldown: float;
@export var weapon_name: String;
@export var reload_cooldown: int;
@export var max_magazine_capacity: int;

@export var reload_timer: Timer;
@export var shoot_timer: Timer;

var current_magazine_capacity: int;
var is_initialized: bool = false;

signal weapon_reload;
signal weapon_shoot;
signal weapon_reload_finished();
signal weapon_shoot_finished();

func _ready() -> void:
	if is_initialized:
		return
	current_magazine_capacity = max_magazine_capacity;
	
	# Initializing timers
	reload_timer.timeout.connect(_on_reload_timeout);
	reload_timer.wait_time = reload_cooldown;
	shoot_timer.timeout.connect(_on_shoot_timeout);
	shoot_timer.wait_time = shoot_cooldown;
	is_initialized = true;
	

func _on_reload_timeout() -> void:
	current_magazine_capacity = max_magazine_capacity
	weapon_reload_finished.emit()
	reload_timer.stop()

func _on_shoot_timeout() -> void:
	weapon_shoot_finished.emit()
	shoot_timer.stop()
	
		
func fix_shot() -> void:
	# if magazine is empty
	if current_magazine_capacity == 0:
		return;
		
	current_magazine_capacity -= 1;
	print(current_magazine_capacity)
	# Check magazine condition
	if current_magazine_capacity == 0:
		reload_timer.start();
		emit_signal("weapon_reload");
	elif current_magazine_capacity > 0:
		shoot_timer.start();
		emit_signal("weapon_shoot");
		
	else:
		print("Weapon error: " + weapon_name + " has negative magazine capacity.")


func get_knockback() -> float:
	return bullet_knockback;


func get_damage() -> float:
	return damage;
