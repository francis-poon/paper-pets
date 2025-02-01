class_name HungerTrait
extends Node

@export var max_hunger: float = 100
@export var hunger_rate: float = 1

var current_hunger: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_hunger = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_hunger = mini(max_hunger, hunger_rate * delta)

func feed(value: float):
	current_hunger = maxf(0, current_hunger - value)
