class_name MobSpawner extends Node2D

@export var Mobs : Array[PackedScene] = []
# Set weights for mobs with respect to mob order in Mobs array. Higher weights have more chances to be chosen
@export var SpawnWeights: Array[int] = []
@export var main_character: Area2D;


signal wave_started;
signal wave_cleared;
signal mob_created;
signal mob_destroyed(money: int);
signal mob_hit(mob: Mob);

var mobs_amount = 20;

var FORTUNE_WHEEL := FortuneWheel.new();

# Cooldown between enemy spawn
var MIN_COOLDOWN = 0.1;
var MAX_COOLDOWN = 1;

var MARKERS_AMOUNT = 10;

var wave_ended = true;
var player_dead = false;
var allow_input = true;
# Amount of mobs on scene for identifying when wave ended
var mobs_counter = 0;

# Create new random
func _ready() -> void:
	randomize();
	
# Upping difficulty of wave
func upgrade_wave():
	mobs_amount += 1;
	MAX_COOLDOWN = max(1.0, MAX_COOLDOWN - 0.05);
	
func select_mob() -> Mob:
	var mob_index = FORTUNE_WHEEL.spin(SpawnWeights);
	return Mobs[mob_index].instantiate();

# Wave casting
func create_wave() -> void:
	emit_signal("wave_started");
	# Creating N mobs
	for i in range(mobs_amount):
		# Wait from previous spawn
		await get_tree().create_timer(randi_range(MIN_COOLDOWN, MAX_COOLDOWN)).timeout;
		print("Спавню!")
		if player_dead:
			return;
			
		var mob = select_mob();
		
		owner.add_child(mob);
		mob.mob_damaged.connect(on_mob_damaged);
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
	

func on_mob_damaged(mob: Mob) -> void:
	emit_signal("mob_hit", mob)
	
	
func on_mob_destroyed(money: int) -> void:
	mobs_counter -= 1;
	emit_signal("mob_destroyed", money);
	if (mobs_counter == 0 and wave_ended):
		emit_signal("wave_cleared");
	print(mobs_counter)		
	
func _process(_delta: float) -> void:
	# If pressed Enter we create new wave or restart the game depending on conditions
	if (Input.is_action_just_pressed("action") and allow_input):
		if (player_dead):
			get_tree().reload_current_scene();
		elif (wave_ended):
			wave_ended = false;			
			upgrade_wave();
			create_wave();
		else:
			pass
