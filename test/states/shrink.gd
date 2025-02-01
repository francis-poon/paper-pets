class_name Shrink
extends TestState

@export var shrink_rate: float = 1
@export var sprite: Sprite2D
var shrink_time: float

func enter():
	shrink_time = randf() * 4
	print("entering shrink state")

func state_update(delta: float):
	shrink_time -= delta
	if shrink_time > 0:
		sprite.scale -= Vector2(shrink_rate * delta, shrink_rate * delta)
	else:
		transitioned.emit(self, "growth")
