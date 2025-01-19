extends Node2D

@onready var ui: Control = $"../CanvasLayer/UI"
@onready var mob_spawner: MobSpawner = $"../MobSpawner"
@onready var main_character: Area2D = $"../MainCharacter"
@onready var camera: Camera2D = $"../Camera"
@onready var animation: AnimationPlayer = $"../Animation"

var wave_cleared: Label;
var wave_number: Label;
var you_died: Label;
var enter_to_start: Label;
var mob_counter: Counter;
var money_counter: Counter;

# Amount of passed waves
var wave_count = 0;
var money = 0;

# Connecting all signals to the manager
func _ready() -> void:
	initialize_variables();
	
	connect_signals();
	
func initialize_variables() -> void:
	wave_cleared = ui.get_node("WaveCleared");
	wave_number = ui.get_node("WaveNumber");
	you_died = ui.get_node("YouDied");
	enter_to_start = ui.get_node("EnterToStart");
	mob_counter = ui.get_node("MobCounter");
	money_counter = ui.get_node("MoneyCounter");
	
	
func connect_signals() -> void:
	mob_spawner.wave_started.connect(on_wave_start);
	mob_spawner.wave_cleared.connect(on_wave_end);
	mob_spawner.mob_created.connect(on_mob_created);
	mob_spawner.mob_destroyed.connect(on_mob_destroyed);
	main_character.is_dead.connect(on_player_death);
	
	
# When new wave started
func on_wave_start() -> void:
	print("Wave start!");
	animation.play("wave_started")
	main_character.can_shoot = true;
	wave_cleared.hide();
	you_died.hide();
	enter_to_start.hide();
	wave_count += 1;
	wave_number.text = "WAVE " + str(wave_count);
	
# When wave ended
func on_wave_end() -> void:
	print("Wave end!");
	animation.play("wave_ended");
	wave_cleared.show();
	enter_to_start.show();
	main_character.can_shoot = false;


func on_mob_created() -> void:
	mob_counter.render(mob_spawner.mobs_counter);

func on_mob_destroyed(reward: int) -> void:
	mob_counter.render(mob_spawner.mobs_counter);
	money += reward;
	money_counter.render(money);
	
# When player died
func on_player_death() -> void:
	you_died.show();
	enter_to_start.show();
	main_character.can_shoot = false;
	mob_spawner.player_dead = true;
