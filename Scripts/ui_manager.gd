class_name UIManager extends Node2D

@export var mob_counter: Counter;
@export var money_counter: Counter;

@export var hp_bar: HPBar;

@export var wave_cleared: Label;
@export var wave_number: Label;
@export var you_died: Label;
@export var enter_to_start: Label;
@export var ammo: Label;
@export var reload: Label;

@export var wave_animation: AnimationPlayer;

func on_mob_created(counter: int) -> void:
	mob_counter.render(counter);
	
	
func on_mob_destroyed(counter: int, money: int) -> void:
	mob_counter.render(counter);
	money_counter.render(money);


func update_ammo(current_ammo: int, max_capacity: int, is_reload: bool):
	ammo.text = str(current_ammo) + "/" + str(max_capacity);
	if is_reload:
		reload.show();
	else:
		reload.hide();
		
func update_hp(hp: int):
	hp_bar.render(hp);
	
func on_wave_start(wave_count: int) -> void:
	wave_cleared.hide();
	you_died.hide();
	enter_to_start.hide();
	wave_number.text = "WAVE " + str(wave_count);
	wave_animation.play("wave_started");
	
func on_wave_end() -> void:
	wave_animation.play("wave_ended");
	wave_cleared.show();
	enter_to_start.show();
	
func on_player_death() -> void:
	you_died.show();
	enter_to_start.show();
