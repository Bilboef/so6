extends CharacterBody2D

var speed = 30
var player_chase = false
var player = null


func _physics_process(delta):

	if player_chase and player != null:
		var direction = (player.position - position).normalized()
		position += direction * speed * delta

		
		$AnimatedSprite2D.play("Idle")
		
		if player.position.x > position.x:
			$AnimatedSprite2D.play("Right")
		elif player.position.x > position.x:
			$AnimatedSprite2D.play("Left")
		elif player.position.x > position.x:
			$AnimatedSprite2D.play("Back")
		else:
			$AnimatedSprite2D.play("Forward")

func _on_detection_area_body_entered(body):
	if body.name == "Player":
		player = body
		player_chase = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == player:
		player_chase = false
		player = null
