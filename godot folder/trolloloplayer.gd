extends CharacterBody2D

var gravity = 18
var jump_height = -500

var direction = 0
var speed = 240

@export var they = 0
@export var thex = 0

@onready var animation = $AnimatedSprite2D
func _process(delta):
	velocity.y += gravity
	
	if velocity.y <= -550:
		velocity.y = -550
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_height
	
	if Input.is_action_pressed("left"):
		direction = -1
		animation.flip_h = true
	elif Input.is_action_pressed("right"):
		direction = 1
		animation.flip_h = false
	
	else:
		direction = 0
		
		
	if Input.is_action_just_pressed("jump") and is_on_wall():
		velocity.y = -550
		velocity.x = direction * speed
		
	
	if is_on_wall():
		gravity = 5
		if velocity.y <= -440:
			velocity.y = -440
	
	else:
		gravity = 18
		
	
	if is_on_floor():
			they = position.y
			thex = position.x
	
	
	velocity.x = direction * speed
	
	move_and_slide()
	print(thex)
	print(they)
	play_animations()
	

func play_animations():
	if is_on_floor():
		if velocity.x == 0:
			animation.play("idle")
		else:
			animation.play("run")
	else:
		if velocity.y > 0:
			animation.play("fall")
		else:
			animation.play("jump")
	
