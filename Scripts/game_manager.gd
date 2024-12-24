extends Node2D

@onready var wave_cleared: Label = $"../CanvasLayer/WaveCleared"
@onready var wave_number: Label = $"../CanvasLayer/WaveNumber"
@onready var mob_spawner: MobSpawner = $"../MobSpawner"

var wave_count = 0;

func _ready() -> void:
	mob_spawner.wave_started.connect(on_wave_start);
	mob_spawner.wave_cleared.connect(on_wave_end);


func on_wave_start() -> void:
	print("Wave start!");
	wave_cleared.hide();
	wave_count += 1;
	wave_number.text = "WAVE " + str(wave_count);
	

func on_wave_end() -> void:
	print("Wave end!");
	wave_cleared.show();
