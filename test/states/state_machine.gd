extends Node

@export var initial_state: TestState

var current_state: TestState
var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is TestState:
			states[child.name.to_lower()] = child
			child.transitioned.connect(_on_state_transitioned)

	if initial_state:
		current_state = initial_state
		current_state.enter()

func _process(delta: float) -> void:
	if current_state:
		current_state.state_update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.state_physics_update(delta)

func _on_state_transitioned(old_state: TestState, new_state_name: String):
	if old_state != current_state:
		return
	
	var new_state: TestState = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()
	
