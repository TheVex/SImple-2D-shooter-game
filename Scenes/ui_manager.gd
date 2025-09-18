class_name UIManager extends Node2D

@export var mob_counter: Counter;
@export var money_counter: Counter;

@export var wave_cleared: Label;
@export var wave_number: Label;
@export var you_died: Label;
@export var enter_to_start: Label;

@export var wave_animation: AnimationPlayer;

func on_mob_created(counter: int) -> void:
	mob_counter.render(counter);
	
	
func on_mob_destroyed(counter: int, money: int) -> void:
	mob_counter.render(counter);
	money_counter.render(money);

	
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
