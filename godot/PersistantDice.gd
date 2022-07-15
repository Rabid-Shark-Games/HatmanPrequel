extends Node2D

class_name PersistantDice

signal destroy_this

var emotion = PersonableDice.emotion.HAPPY

var min_health_last_game = 100

var diag_options = {
	"HAPPY_insane": 2
}

func make_emotion():
	if min_health_last_game < 10:
		emotion = PersonableDice.emotion.THAT_WAS_CLOSE
	
func talk():
	var en = PersonableDice.emotion.keys()[emotion] + "_insane"
	DialogueManager.show_example_dialogue_balloon(
		en + "_" + str(randi() % diag_options[en] + 1),
		PersonableDice.dialog)
	yield(DialogueManager, "dialogue_finished")
	print("gaming")
	emit_signal("destroy_this")
