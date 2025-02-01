class_name Bored
extends State

@export var animation_player: AnimationPlayer
@export var animation_name: String

@export var care_trait: CareTrait

func enter():
	print("Bored")
	#animation_player.play(animation_name)

func state_update(delta: float):
	if care_trait.trait_value >= 30:
		transitioned.emit(self, "happy")
