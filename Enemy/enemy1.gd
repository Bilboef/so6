extends CharacterBody2D

var speed = 25
var player_chase = false
var player = null


func _physics_process(delta):

	if player_chase:
		var direction = (player.position - position).normalized()
		position += direction * speed * delta

		
		if player.position.x > position.x:
			$AnimatedSprite2D.play("Right")
		elif player.position.x < position.x:
			$AnimatedSprite2D.play("Left")
		elif player.velocity.y < position.y:
			$AnimatedSprite2D.play("Back")
		elif player.velocity.y > position.y:
			$AnimatedSprite2D.play("Forward")
		else:
			$AnimatedSprite2D.play("Idle")


func _on_detection_area_body_entered(body):
	if body.name == "Player":
		player = body
		player_chase = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == player:
		player_chase = false
		player = null
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.play("Idle")
