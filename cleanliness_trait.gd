class_name CleanlinessTrait
extends Node

signal cleanliness_changed(value: float)

@export var max_cleanliness: float = 100
@export var cleanliness_decay: float = 1

var current_cleanliness: float:
	set(value):
		current_cleanliness = value
		cleanliness_changed.emit(value)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_cleanliness = max_cleanliness

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_cleanliness = maxi(0, cleanliness_decay * delta)

func interact(value: float):
	current_cleanliness = mini(max_cleanliness, current_cleanliness + value)
