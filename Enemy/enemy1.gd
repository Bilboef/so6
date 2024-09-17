extends CharacterBody2D

var speed = 40
@export var endPoint: Marker2D

var startPosition
var endPosition

var player_chase = false
var player


func _physics_process(delta):
	
	if player_chase:
		position += (player.position - position)/speed
		$AnimatedSprite2D.play("Idle")
		
	if(player.position.x - position.x) < 0:
		$AnimatedSprite2D.play("Right")
	else:
		$AnimatedSprite2D.play("Left")


func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = body
	player_chase = false
