class_name Paste
extends Card

func _interact(current_in_hand: Card) -> Card:
	if current_in_hand is Spoon:
		current_in_hand._set_paste(true)
	return current_in_hand
