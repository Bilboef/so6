extends CharacterBody2D

@export var speed: int = 35
@export var run_speed: int = 200
@export var current_speed: = 35
@onready var animations = $AnimationPlayer

func handleInput():
	var moveDirection = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if Input.is_action_pressed("ui_run"):
		current_speed = run_speed
	else:
		current_speed = speed
		
		velocity = moveDirection * current_speed
	

func updateAnimation():
	if velocity.length() == 0:
		animations.stop()
	else:
		var direction = "down"
		if velocity.x < 0: direction = "left"
		elif velocity.x > 0: direction = "right"
		elif velocity.y < 0: direction = "up"
		animations.play(direction)

func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()
