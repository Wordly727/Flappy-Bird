extends Node

func _physics_process(delta):
	if $Bird.state != $Bird.states.DEAD: #Move Background
		$Tiles.position.x -= 4
		if $Tiles.position.x == -432:
			$Tiles.position.x = 0
		if Input.is_action_just_pressed("jump"): #Start Game
			$Bird.state = $Bird.states.ALIVE
			$UI/Start.hide()
	if $Bird.state == $Bird.states.DEAD: #Show Game Over Text
		$UI/GameOver.show()
		if Input.is_action_just_pressed("jump"): #Restart Game
			get_tree().reload_current_scene()
func _on_DeadArea_body_exited(body):
	if body.is_in_group("bird"): #Change Bird State to Dead
		body.dead()
