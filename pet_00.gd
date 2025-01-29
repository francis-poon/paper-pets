class_name Pet
extends CharacterBody2D

signal care_trait_changed(trait_name: Constants.CareTraitTypes, value: float)

@export var _care_traits: Node

var care_trait_dict = {}

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	for child in _care_traits.get_children():
		if child is not CareTrait:
			continue
		var care_trait: CareTrait = child
		care_trait_dict[care_trait.trait_name] = care_trait
		care_trait.trait_value_changed.connect(_on_care_trait_changed)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_care_trait_changed(trait_name: Constants.CareTraitTypes, value: float):
	care_trait_changed.emit(trait_name, value)
	
func add_care(trait_name: Constants.CareTraitTypes, care_amount: float):
	if care_trait_dict.has(trait_name):
		var care_trait: CareTrait = care_trait_dict[trait_name]
		care_trait.add_care(care_amount)
