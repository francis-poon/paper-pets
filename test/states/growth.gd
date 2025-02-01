class_name Growth
extends TestState

@export var growth_rate: float = 1
@export var sprite: Sprite2D
var growth_time: float

func enter():
	growth_time = randf() * 4

func state_update(delta: float):
	growth_time -= delta
	if growth_time > 0:
		sprite.scale += Vector2(growth_rate * delta, growth_rate * delta)
	else:
		transitioned.emit(self, "shrink")
