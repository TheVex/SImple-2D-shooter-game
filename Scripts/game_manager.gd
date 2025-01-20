extends Node2D

#@onready var ui: Control = $"../CanvasLayer/UI"

@onready var mob_spawner: MobSpawner = $"../MobSpawner"
@onready var main_character: Area2D = $"../MainCharacter"
@onready var camera: Camera2D = $"../Camera"
@onready var animation: AnimationPlayer = $"../Animation"

'''
var wave_cleared: Label;
var wave_number: Label;
var you_died: Label;
var enter_to_start: Label;
var mob_counter: Counter;
var money_counter: Counter;
var shop_button: Node2D;
'''
@onready var wave_cleared: Label = $"../LabelLayer/WaveCleared"
@onready var wave_number: Label = $"../LabelLayer/WaveNumber"
@onready var you_died: Label = $"../LabelLayer/YouDied"
@onready var enter_to_start: Label = $"../LabelLayer/EnterToStart"
@onready var mob_counter: Counter = $"../UI Layer/MobCounter"
@onready var money_counter: Counter = $"../UI Layer/Right-up Node/MoneyCounter"
@onready var shop_button: Node2D = $"../UI Layer/Right-up Node/ShopButton"


# Amount of passed waves
var wave_count = 0;
var money = 0;

var is_animation_finished = false;

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
	
	shop_button.shop_activated.connect(on_shop_activated);
	shop_button.shop_exited.connect(on_shop_exited);
	
	
func on_shop_activated() -> void:
	if is_animation_finished:
		animation.play("activate_shop");
		shop_button.shop_button.disabled = true;
		is_animation_finished = false;
	

func on_shop_exited() -> void:
	if is_animation_finished:
		animation.play("shop_exit");
		shop_button.shop_button.disabled = false;
		is_animation_finished = false;


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


func _on_animation_finished(anim_name: StringName) -> void:
	is_animation_finished = true;
