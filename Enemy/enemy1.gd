extends CharacterBody2D

var speed = 40
var player_chase = false
var player = null


func _physics_process(delta):
	print_debug(player.position)
	# Tjekker først om player eksisterer, før vi bruger dens position
	if player_chase and player != null and player.has_method("get_position"):
		# Fjenden bevæger sig mod spilleren
		position += (player.position - position).normalized() * speed * delta

		# Tjekker hvilken side fjenden er på i forhold til spilleren
		if player.position.x > position.x:
			$AnimatedSprite2D.play("Right")
		else:
			$AnimatedSprite2D.play("Left")
	#else:
		#print("Player chase is off or player is null.")

func _on_detection_area_body_entered(body):
	# Tjekker om body er spilleren, før fjenden begynder at jagte
	if body.name == "Player":  # Skift "Player" til det navn, du har givet spilleren
		player = body
		player_chase = true
		print("Player detected! Starting chase.")

func _on_detection_area_body_exited(body):
	# Stopper jagten, når spilleren forlader detektionsområdet
	if body == player:
		player_chase = false
		player = null
		print("Player left the area. Stopping chase.")
