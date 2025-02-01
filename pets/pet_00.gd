class_name Pet
extends CharacterBody2D

signal care_trait_changed(trait_name: Constants.CareTraitTypes, value: float)

enum PetState {
	IDLE,
	HAPPY,
	BORED,
	HUNGRY,
	DIRTY
}

@export var _care_traits_container: Node
@export var _initial_state: PetState
@export var _animation_player: AnimationPlayer

var care_trait_dict = {}
var current_state: PetState


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	for child in _care_traits_container.get_children():
		if child is not CareTrait:
			continue
		var care_trait: CareTrait = child
		care_trait_dict[care_trait.trait_name] = care_trait
		care_trait.trait_value_changed.connect(_on_care_trait_changed)
	
	_set_state(_initial_state)

func _process(delta: float) -> void:
	match current_state:
		PetState.BORED:
			if not _is_bored():
				if _is_hungry():
					_set_state(PetState.HUNGRY)
				elif _is_dirty():
					_set_state(PetState.DIRTY)
				else:
					_set_state(PetState.IDLE)
		PetState.HUNGRY:
			if not _is_hungry():
				if _is_bored():
					_set_state(PetState.BORED)
				elif _is_dirty():
					_set_state(PetState.DIRTY)
				else:
					_set_state(PetState.IDLE)
		PetState.DIRTY:
			if not _is_dirty():
				if _is_hungry():
					_set_state(PetState.HUNGRY)
				elif _is_bored():
					_set_state(PetState.BORED)
				else:
					_set_state(PetState.IDLE)
		PetState.IDLE, PetState.HAPPY:
			if _is_bored():
				_set_state(PetState.BORED)
			elif _is_hungry():
				_set_state(PetState.HUNGRY)
			elif _is_dirty():
				_set_state(PetState.DIRTY)
			elif _is_happy():
				_set_state(PetState.HAPPY)
			else:
				_set_state(PetState.IDLE)


func _on_care_trait_changed(trait_name: Constants.CareTraitTypes, value: float):
	care_trait_changed.emit(trait_name, value)
	
func add_care(trait_name: Constants.CareTraitTypes, care_amount: float):
	if care_trait_dict.has(trait_name):
		var care_trait: CareTrait = care_trait_dict[trait_name]
		care_trait.add_care(care_amount)

func _is_bored() -> bool:
	return care_trait_dict[Constants.CareTraitTypes.ATTENTION].trait_value < 30

func _is_hungry() -> bool:
	return care_trait_dict[Constants.CareTraitTypes.SATIATION].trait_value < 30

func _is_dirty() -> bool:
	return care_trait_dict[Constants.CareTraitTypes.CLEANLINESS].trait_value < 30

func _is_happy() -> bool:
	var is_happy: bool = true
	is_happy = is_happy && care_trait_dict[Constants.CareTraitTypes.SATIATION].trait_value > 70
	is_happy = is_happy && care_trait_dict[Constants.CareTraitTypes.ATTENTION].trait_value > 70
	is_happy = is_happy && care_trait_dict[Constants.CareTraitTypes.CLEANLINESS].trait_value > 70
	
	return is_happy

func _set_state(new_state: PetState):
	if current_state == new_state:
		return
	
	current_state = new_state
	Logger.debug("Setting state to {0}".format([PetState.keys()[current_state]]))
	match current_state:
		PetState.IDLE:
			_animation_player.play("idle")
		PetState.HAPPY:
			_animation_player.play("happy")
		PetState.BORED:
			_animation_player.play("bored")
		PetState.HUNGRY:
			_animation_player.play("hungry")
		PetState.DIRTY:
			_animation_player.play("dirty")
