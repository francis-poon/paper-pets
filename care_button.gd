class_name CareButton
extends Button

signal add_care(care_trait: Constants.CareTraitTypes, care_amount: float)

@export var care_trait: Constants.CareTraitTypes
@export var care_amount: float = 10


func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed():
	add_care.emit(care_trait, care_amount)
