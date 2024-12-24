extends CharacterBody2D

@export var Bullet : PackedScene
@onready var cooldown = $WeaponCooldown

var speed = 500;

var is_cooldown = false;
var cooldown_time = 0.3;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cooldown.timeout.connect(_on_timer_timeout);
	cooldown.wait_time = cooldown_time;

func _on_timer_timeout():
	is_cooldown = false;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (Input.is_action_pressed("ui_right")):
		scale.x = 1;
		shoot();
	if (Input.is_action_pressed("ui_left")):
		scale.x = -1
		shoot(); 


func shoot() -> void:
	if !is_cooldown:
		var bullet = Bullet.instantiate();
		owner.add_child(bullet);
		bullet.transform = $Muzzle.global_transform;
		is_cooldown = true;
		cooldown.start()
