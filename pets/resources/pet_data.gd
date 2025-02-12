class_name PetData
extends Resource

@export var trait_data: Dictionary
@export var current_state: Pet.PetState

func _init(p_trait_data: Dictionary = {}, p_current_state: Pet.PetState = Pet.PetState.IDLE) -> void:
	trait_data = p_trait_data
	current_state = p_current_state
