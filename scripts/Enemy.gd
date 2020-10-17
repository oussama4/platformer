extends Actor


onready var anim_sprite: AnimatedSprite = $AnimatedSprite


func _ready() -> void:
	velocity.x = -speed.x
	
	
func _physics_process(delta: float) -> void:
	velocity.y += delta * gravity
	if is_on_wall():
		velocity.x *= -1.0
		
	anim_sprite.flip_h = velocity.x > 0
	velocity.y = move_and_slide(velocity, Vector2.UP).y 


func _on_screen_entered() -> void:
	anim_sprite.animation = "walk"


func _on_screen_exited() -> void:
	anim_sprite.animation = "idle"


func _on_body_entered(body: Node) -> void:
	var delta_pos = body.global_position - $Area2D.global_position
	if delta_pos.abs().x > $Area2D/CollisionShape2D.shape.extents.x:
		return
	
	$CollisionShape2D.set_deferred("disabled", true)
	queue_free()
