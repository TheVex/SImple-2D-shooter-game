extends Node2D

@onready var wave_cleared: Label = $"../CanvasLayer/WaveCleared"
@onready var wave_number: Label = $"../CanvasLayer/WaveNumber"
@onready var mob_spawner: MobSpawner = $"../MobSpawner"
@onready var main_character: Area2D = $"../MainCharacter"
@onready var you_died: Label = $"../CanvasLayer/YouDied"
@onready var enter_to_start: Label = $"../CanvasLayer/EnterToStart"

# Amount of passed waves
var wave_count = 0;

# Connecting all signals to the manager
func _ready() -> void:
	mob_spawner.wave_started.connect(on_wave_start);
	mob_spawner.wave_cleared.connect(on_wave_end);
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

# When player died
func on_player_death() -> void:
	you_died.show();
	enter_to_start.show();
	main_character.can_shoot = false;
	mob_spawner.player_dead = true;
