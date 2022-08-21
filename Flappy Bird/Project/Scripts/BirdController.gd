extends KinematicBody2D

enum states {FLY,ALIVE,DEAD}
var state = states.FLY
var motion = Vector2()
var jumpForce = 550
var gravity = 20

func _ready():
	$AnimationPlayer.play("fly")
func _physics_process(delta):
	match state:
		states.ALIVE: #Jump And Gravity And Animations
			motion.y += gravity
			if Input.is_action_just_pressed("jump"):
				motion.y = -jumpForce
				$AnimationPlayer.play("jump")
			if motion.y < 0: #Look Up
				rotation_degrees = lerp(rotation_degrees,-32,0.2)
			else: #Look Down
				rotation_degrees = lerp(rotation_degrees,32,0.2)
		states.DEAD: #Stop Movement
			motion = Vector2(0,0)
	motion = move_and_slide(motion)
func dead():
	state = states.DEAD
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "jump":
		$AnimationPlayer.play("fall")
