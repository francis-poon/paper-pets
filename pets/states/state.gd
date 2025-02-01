class_name State
extends Node

signal transitioned(old_state: State, new_state_name: String)

@export var state_name: String

func _init() -> void:
	if state_name.length() == 0:
		state_name = name.to_lower()

func enter():
	pass

func exit():
	pass

func state_update(delta: float):
	pass

func state_physics_update(delta: float):
	pass
