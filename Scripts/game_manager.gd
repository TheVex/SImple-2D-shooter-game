extends Node2D

@onready var wave_cleared: Label = $"../UI/WaveCleared"
@onready var wave_number: Label = $"../UI/WaveNumber"
@onready var mob_spawner: MobSpawner = $"../MobSpawner"
@onready var main_character: Area2D = $"../MainCharacter"
@onready var you_died: Label = $"../UI/YouDied"
@onready var enter_to_start: Label = $"../UI/EnterToStart"
@onready var mob_counter: Counter = $"../UI/Control/HBoxContainer/MobCounter"

@onready var money_counter: Counter = $"../UI/Control/HBoxContainer/MoneyCounter"

# Amount of passed waves
var wave_count = 0;
var money = 0;

# Connecting all signals to the manager
func _ready() -> void:
	mob_spawner.wave_started.connect(on_wave_start);
	mob_spawner.wave_cleared.connect(on_wave_end);
	mob_spawner.mob_created.connect(on_mob_created);
	mob_spawner.mob_destroyed.connect(on_mob_destroyed);
	main_character.is_dead.connect(on_player_death)

# When new wave started
func on_wave_start() -> void:
	print("Wave start!");
	main_character.can_shoot = true;
	wave_cleared.hide();
	you_died.hide();
	enter_to_start.hide();
	wave_count += 1;
	wave_number.text = "WAVE " + str(wave_count);
	
# When wave ended
func on_wave_end() -> void:
	print("Wave end!");
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
