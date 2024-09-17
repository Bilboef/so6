extends CharacterBody2D

var speed = 25
var player_chase = false
var player = null
@onready var animations = $AnimationPlayer

func _physics_process(delta):

	if player_chase and player != null:
		var direction = (player.position - position).normalized()
		position += direction * speed * delta

		func updateAnimation():
	if velocity.length() == 0:
		animations.stop()
	else:
		var direction = "Forward"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Back"
		animations.play(direction)
		
		

func _on_detection_area_body_entered(body):
	if body.name == "Player":
		player = body
		player_chase = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == player:
		player_chase = false
		player = null
