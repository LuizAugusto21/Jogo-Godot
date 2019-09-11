extends KinematicBody2D
const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 100
const JUMP_HEIGHT = -300
signal hit
var move = Vector2()
var life = 3



func _process(delta):
	move .y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		move.x = SPEED
		$AnimatedSprite.animation = "mover"
	elif Input.is_action_pressed("ui_left"):
		move.x  = -SPEED
		$AnimatedSprite.animation = "mover"
	
	else:
		move.x = 0
		$AnimatedSprite.animation = "parado"
	if move.y<0:
			$AnimatedSprite.animation = "Fall"
	if move.x < 0:
		$AnimatedSprite.flip_h = true
	if move.x > 0:
		$AnimatedSprite.flip_h = false
	
	if is_on_floor(): 
		if Input.is_action_pressed("ui_up"):
			move.y = JUMP_HEIGHT
			$AnimatedSprite.animation = "jump"
	move = move_and_slide(move, UP)


func _on_Area2D_body_entered(body):
	pass # Replace with function body.
	hide()  # Player disappears after being hit.
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
    position = pos
    show()
    $CollisionShape2D.disabled = true

func _on_pes_body_entered(body):
	body.dano()
	move.y = JUMP_HEIGHT

func _on_dano_body_entered(body):
	life -= 1
	if life==0:
		get_tree().change_scene("res://menu.tscn")
	