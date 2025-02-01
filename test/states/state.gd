class_name TestState
extends Node

signal transitioned(old_state: TestState, new_state_name: String)

func enter():
	pass

func exit():
	pass

func state_update(delta: float):
	pass

func state_physics_update(delta: float):
	pass
