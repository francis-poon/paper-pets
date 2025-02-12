extends Node2D

@export var resource: Resource
@export var label: Label

var t_val: int:
	set(value):
		label.text = str(value)
		t_val = value

var resource_path: String = "res://test/saving/stats.tres"

func _ready() -> void:
	t_val = resource.t_val

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		t_val += 1
	if event.is_action_pressed("ui_down"):
		t_val -= 1
	if event.is_action_pressed("save"):
		resource.t_val = t_val
		ResourceSaver.save(resource, resource_path)
		
