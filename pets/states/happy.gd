class_name Happy
extends State

@export var animation_player: AnimationPlayer
@export var animation_name: String

@export var care_traits: Node
var trait_to_state_dict: Dictionary

var care_trait_dict = {}

func _ready() -> void:
	trait_to_state_dict[Constants.CareTraitTypes.SATIATION] = $"../Hungry"
	trait_to_state_dict[Constants.CareTraitTypes.CLEANLINESS] = $"../Dirty"
	trait_to_state_dict[Constants.CareTraitTypes.ATTENTION] = $"../Bored"
	for child in care_traits.get_children():
		if child is not CareTrait:
			continue
		var care_trait: CareTrait = child
		care_trait_dict[care_trait.trait_name] = care_trait

func enter():
	print("Happy")
	#animation_player.play(animation_name)

func state_update(delta: float):
	for x in care_trait_dict.keys():
		var care_trait: CareTrait = care_trait_dict[x]
		if care_trait.trait_value < 30 and trait_to_state_dict.has(care_trait.trait_name):
			var state: State = trait_to_state_dict[care_trait.trait_name]
			transitioned.emit(self, state.state_name)
