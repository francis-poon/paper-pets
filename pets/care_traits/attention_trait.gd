class_name AttentionTrait
extends Node

@export var max_attention: float = 100
@export var attention_decay: float = 1

var current_attention: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_attention = max_attention

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_attention = maxi(0, attention_decay * delta)

func interact(value: float):
	current_attention = mini(max_attention, current_attention + value)
