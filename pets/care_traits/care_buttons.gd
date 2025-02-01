extends HBoxContainer

signal add_care(care_trait: Constants.CareTraitTypes, care_amount: float)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		var button: CareButton = child
		button.add_care.connect(_on_add_care)

func _on_add_care(care_trait: Constants.CareTraitTypes, care_amount: float):
	add_care.emit(care_trait, care_amount)
