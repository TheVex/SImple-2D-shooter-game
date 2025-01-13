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

var MARKERS_AMOUNT = 10;

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
		# Wait from previous spawn
		await get_tree().create_timer(randi_range(MIN_COOLDOWN, MAX_COOLDOWN)).timeout;
		print("Спавню!")
		if player_dead:
			return;
			
		var mob = Mob.instantiate();
		owner.add_child(mob);
		
		mob.destroyed.connect(on_mob_destroyed)
		mobs_counter += 1;
		emit_signal("mob_created");
		
		# Specify at which spawner spawn monster
		var spawner_number = randi_range(1, MARKERS_AMOUNT);
		var spawner = get_node("Marker{n}".format({"n": spawner_number}))
		mob.transform = spawner.global_transform;
		mob.z_index = spawner.z_index;
		
		if spawner_number > MARKERS_AMOUNT / 2:
			mob.transform.x = -mob.transform.x;

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
