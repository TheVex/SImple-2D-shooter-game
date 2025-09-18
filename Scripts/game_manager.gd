extends Node2D

#@onready var ui: Control = $"../CanvasLayer/UI"

@export var mob_spawner: MobSpawner;
@export var main_character: MainCharacter;
@export var ui_manager: UIManager;


# Amount of passed waves
var wave_count = 0;
var money = 0;

var is_animation_finished = true;

# Connecting all signals to the manager
func _ready() -> void:
	initialize_variables();
	connect_signals();
	
func initialize_variables() -> void:
	pass;
	

func connect_signals() -> void:
	mob_spawner.wave_started.connect(on_wave_start);
	mob_spawner.wave_cleared.connect(on_wave_end);
	mob_spawner.mob_created.connect(on_mob_created);
	mob_spawner.mob_destroyed.connect(on_mob_destroyed);
	main_character.is_dead.connect(on_player_death);
	

func on_mob_created() -> void:
	ui_manager.on_mob_created(mob_spawner.mobs_counter)
	
func on_mob_destroyed(reward: int) -> void:
	money += reward;
	ui_manager.on_mob_destroyed(mob_spawner.mobs_counter, money)

# When new wave started
func on_wave_start() -> void:
	wave_count += 1;
	ui_manager.on_wave_start(wave_count);
	main_character.can_shoot_enforced = true;
	
# When wave ended
func on_wave_end() -> void:
	ui_manager.on_wave_end();
	main_character.can_shoot_enforced = false;

# When player died
func on_player_death() -> void:
	ui_manager.on_player_death();
	main_character.can_shoot_enforced = false;
	mob_spawner.player_dead = true;
