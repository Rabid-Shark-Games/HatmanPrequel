extends Node2D

var dialog = preload("res://main_nonsense.tres")

enum emotion {
	HAPPY,
	LOSS,
	DISTAIN,
	HUNGRY,
	SUPRISE,
	GAMING,
	THINKING,
	THAT_WAS_CLOSE
}

var emotion_strength = [
	1.0,
	3.0,
	0.0, # Currently impossible
	0.0, # These are all speaking emotions, used for dialog images
	0.0,
	100.0,
	0.0,
	10.0,
]
