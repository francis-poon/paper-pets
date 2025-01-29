extends Node2D

@export var pet: Pet
@export var care_buttons: Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in care_buttons.get_children():
		var button: CareButton = child
		button.add_care.connect(_on_add_care)

func _on_add_care(care_trait: Constants.CareTraitTypes, care_amount: float):
	pet.add_care(care_trait, care_amount)
