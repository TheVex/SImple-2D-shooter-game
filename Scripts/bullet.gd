class_name Bullet extends Area2D

var speed: int;
var damage: int;
var knockback: int;
var direction = Vector2();

# Every physics frame it moves from character direction
func _physics_process(delta: float) -> void:
	position += direction * speed * delta;
	rotation = direction.angle();
	# Delete bullet if it is out of the screen
	if !get_viewport().get_visible_rect().has_point(global_position):
		queue_free();

# When collides with object
func _on_body_entered(body: Node2D) -> void:
	# If object is mob, deal damage to him and delete bullet
	if body is Mob and !body.on_death:
		body.change_health(damage, knockback);
		queue_free();
