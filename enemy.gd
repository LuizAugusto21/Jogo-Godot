extends StaticBody2D
var flip = true
var posfinal
var posinicial
func _ready():
	$Sprite.play("enemy")
	posinicial = $".".position.x
	posfinal = posinicial + 50

func _process(delta):
	if(posinicial<=posfinal and flip):
		$".".position.x += 0.3
		$Sprite.flip_h = false
		if($".".position.x >= posfinal):
			flip = false
	if ($".".position.x>= posinicial and !flip):
		$".".position.x -= 0.3
		$Sprite.flip_h = true
		if($".".position.x <= posinicial):
			flip = true
func dano():
	$".".queue_free()