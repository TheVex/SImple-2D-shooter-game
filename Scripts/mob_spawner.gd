class_name MobSpawner extends Node2D

@export var Mob : PackedScene
@onready var main_character: Area2D = $"../MainCharacter"


signal wave_started;
signal wave_cleared;
signal mob_created;
signal mob_destroyed(money: int);

var mobs_amount = 5;
var MOB_SIZE = 5;

# Cooldown between enemy spawn
var MIN_COOLDOWN = 2;
var MAX_COOLDOWN = 5.0;

# Deviation from spawner within enemy will be spawn
var Y_RANGE = 100;

var wave_ended = true;
var player_dead = false;

# Amount of mobs on scene for identifying when wave ended
var mobs_counter = 0;

# Create new random
func _ready() -> void:
	randomize();
	
# Upping difficulty of wave
func upgrade_wave():
	mobs_amount += 1;
	MAX_COOLDOWN = max(1.0, MAX_COOLDOWN - 0.05);
	
# Wave casting
func create_wave() -> void:
	emit_signal("wave_started");
	for i in range(mobs_amount):
		await get_tree().create_timer(randi_range(MIN_COOLDOWN, MAX_COOLDOWN)).timeout;
		print("Спавню!")
		if player_dead:
			return;
		var mob = Mob.instantiate();
		
		owner.add_child(mob);
		
		mob.destroyed.connect(on_mob_destroyed)
		mobs_counter += 1;
		emit_signal("mob_created");
		
		var y_range = randi_range(-Y_RANGE, Y_RANGE);
		if randi_range(0, 1) == 0:
			mob.transform = $LeftMarker.global_transform;
		else:
			mob.transform = $RightMarker.global_transform;
			mob.transform.x = -mob.transform.x;
		mob.global_position += Vector2(0, y_range);
		mob.direction = (main_character.global_position - mob.global_position).normalized();	
	wave_ended = true;
	

func on_mob_destroyed(money: int) -> void:
	mobs_counter -= 1;
	emit_signal("mob_destroyed", money);
	if (mobs_counter == 0 and wave_ended):
		emit_signal("wave_cleared");
	print(mobs_counter)		
	
	
		
func _process(_delta: float) -> void:
	# If pressed Enter we create new wave or restart the game depending on conditions
	if (Input.is_action_just_pressed("action")):
		if (player_dead):
			get_tree().reload_current_scene();
		elif (wave_ended):
			wave_ended = false;			
			upgrade_wave();
			create_wave();
