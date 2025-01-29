class_name CareTrait
extends Node

signal trait_value_changed(trait_name: Constants.CareTraitTypes, value: float)

@export var trait_name: Constants.CareTraitTypes
@export var trait_max_value: float = 100
@export var trait_decay_rate: float = 1

var trait_value: float:
	set(value):
		trait_value = value
		trait_value_changed.emit(trait_name, value)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	trait_value = trait_max_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	trait_value = maxf(0, trait_value - trait_decay_rate * delta)

func add_care(value: float):
	trait_value = minf(trait_max_value, trait_value + value)
