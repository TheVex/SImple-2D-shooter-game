extends Area2D

var speed = 1000;
var damage = 10;
var knockback = 30;
var SCREEN_WIDTH;

# Applied when object is initialized
func _ready() -> void:
	SCREEN_WIDTH = get_viewport().get_visible_rect().size.x;

# Every physics frame it moves from character direction
func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta;
	# Delete bullet if it is out of the screen
	if (position.x < 0 or position.x > SCREEN_WIDTH):
		queue_free();

# When collides with object
func _on_body_entered(body: Node2D) -> void:
	# If object is mob, deal damage to him and delete bullet
	if body is Mob:
		body.change_health(damage, knockback);
		queue_free();
