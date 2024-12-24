extends Area2D

@export var Bullet : PackedScene
@onready var cooldown = $WeaponCooldown

signal is_dead

var speed = 500;

var is_cooldown = false;
var cooldown_time = 0.3;
var can_shoot = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cooldown.timeout.connect(_on_timer_timeout);
	cooldown.wait_time = cooldown_time;

func _on_timer_timeout():
	is_cooldown = false;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (Input.is_action_pressed("left") and can_shoot):
		scale.x = 1;
		shoot();
	if (Input.is_action_pressed("right") and can_shoot):
		scale.x = -1
		shoot(); 

# Shoot from some weapon
func shoot() -> void:
	if !is_cooldown:
		var bullet = Bullet.instantiate();
		owner.add_child(bullet);
		bullet.transform = $Muzzle.global_transform;
		is_cooldown = true;
		cooldown.start()



func _on_body_entered(body: Node2D) -> void:
	if body is Mob:
		emit_signal("is_dead");
		queue_free();
