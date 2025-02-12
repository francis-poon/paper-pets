extends Node2D

@export var pet: Pet
@export var care_buttons: Control

var save_dir: String = "user://saves/"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DirAccess.make_dir_absolute(save_dir)
	for node in get_tree().get_nodes_in_group("saveable"):
		if not node.has_method("load_data"):
			Logger.warn("Node {0} is in group \"saveable\" but does not have load_data method".format([node.name]))
			continue
		node.load_data(save_dir)
	
	for child in care_buttons.get_children():
		var button: CareButton = child
		button.add_care.connect(_on_add_care)

func _on_add_care(care_trait: Constants.CareTraitTypes, care_amount: float):
	pet.add_care(care_trait, care_amount)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("save"):
		for node in get_tree().get_nodes_in_group("saveable"):
			if not node.has_method("save_data"):
				Logger.warn("Node {0} is in group \"saveable\" but does not have save_data method".format([node.name]))
				continue
			node.save_data(save_dir)
