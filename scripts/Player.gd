extends KinematicBody2D


export var gravity: = 1000
export var speed: = Vector2(100, 200)
var velocity: = Vector2.ZERO
onready var anim_sprite: AnimatedSprite = $AnimatedSprite


func _physics_process(delta: float) -> void:
	var direction: = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("jump") and is_on_floor():
		direction.y -= 1
	
	if direction.length() > 0:
		anim_sprite.play()
	else:
		anim_sprite.stop()
		
	if direction.x != 0:
		anim_sprite.animation = "walk"
	elif direction.y != 0:
		anim_sprite.animation = "jump"
	else:
		anim_sprite.animation = "idle"
		
	velocity.y += gravity * delta
	velocity += direction * speed
	velocity = move_and_slide(velocity, Vector2.UP)