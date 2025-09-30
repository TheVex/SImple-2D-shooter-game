extends Node2D

@export var mob_spawner: MobSpawner;
@export var main_character: MainCharacter;
@export var ui_manager: UIManager;

# Amount of passed waves
var wave_count = 0;
var money = 0;

var is_animation_finished = true;


# Connecting all signals to the manager
func _ready() -> void:
	connect_signals();
	update_hp();

# Checking out-of-character input
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("escape"):
		leave_game()

# Handler leaving the game
func leave_game():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	

func connect_signals() -> void:
	mob_spawner.wave_started.connect(on_wave_start);
	mob_spawner.wave_cleared.connect(on_wave_end);
	mob_spawner.mob_created.connect(on_mob_created);
	mob_spawner.mob_destroyed.connect(on_mob_destroyed);
	
	main_character.is_dead.connect(on_player_death);
	main_character.update_ammo_ui.connect(ui_manager.update_ammo);
	main_character.lost_hp.connect(update_hp);

func update_hp():
	ui_manager.update_hp(main_character.get_hp());
	
# When mob spawns
func on_mob_created() -> void:
	ui_manager.on_mob_created(mob_spawner.mobs_counter);
	
# When mob destroyed
func on_mob_destroyed(reward: int) -> void:
	money += reward;
	ui_manager.on_mob_destroyed(mob_spawner.mobs_counter, money);
	
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
