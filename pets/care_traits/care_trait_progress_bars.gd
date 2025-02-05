extends VBoxContainer

@export var satiation_bar: TextureProgressBar
@export var attention_bar: TextureProgressBar
@export var cleanliness_bar: TextureProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_care_trait_changed(trait_name: Constants.CareTraitTypes, value: float):
	match trait_name:
		Constants.CareTraitTypes.SATIATION:
			satiation_bar.value = value
		Constants.CareTraitTypes.ATTENTION:
			attention_bar.value = value
		Constants.CareTraitTypes.CLEANLINESS:
			cleanliness_bar.value = value
