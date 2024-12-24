class_name MobSpawner extends Node2D

@export var Mob : PackedScene

signal wave_started;
signal wave_cleared;


var wave_amount = 10;
var MIN_COOLDOWN = 0.5;
var MAX_COOLDOWN = 3.0;

var wave_ended = true;
var mobs_count = 0;


func _ready() -> void:
	randomize();
	
func upgrade_wave():
	wave_amount += 1;
	MAX_COOLDOWN = max(1.0, MAX_COOLDOWN - 0.05);
	
func create_wave() -> void:
	emit_signal("wave_started");
	for i in range(wave_amount):
		await get_tree().create_timer(randi_range(MIN_COOLDOWN, MAX_COOLDOWN)).timeout;
		print("Спавню!")
		var mob = Mob.instantiate();
		owner.add_child(mob);
		mob.destroyed.connect(on_mob_destroyed)
		mobs_count += 1;
			
		if randi_range(0, 1) == 0:
			mob.transform = $LeftMarker.global_transform;
		else:
			mob.transform = $RightMarker.global_transform;
			mob.transform.x = -mob.transform.x;	
	wave_ended = true;
	

func on_mob_destroyed() -> void:
	mobs_count -= 1;
	if (mobs_count == 0 and wave_ended):
		emit_signal("wave_cleared");
	print(mobs_count)		
	
func _process(_delta: float) -> void:
	'''
	if (Input.is_action_just_pressed("ui_down")):
		var mob = Mob.instantiate();
		owner.add_child(mob);
		mob.transform = $LeftMarker.global_transform;
	if (Input.is_action_just_pressed("ui_up")):
		var mob = Mob.instantiate();
		owner.add_child(mob);
		mob.transform = $RightMarker.global_transform;
		mob.transform.x = -mob.transform.x;
		'''
	if (Input.is_action_just_pressed("ui_accept") && wave_ended):
		wave_ended = false;
		
		upgrade_wave();
		create_wave();
