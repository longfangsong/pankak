class_name Shovel
extends Card

func _interact(current_in_hand: Card) -> Card:
	if current_in_hand == null:
		inHand = true
		global_position.y += 100
		return self
	return current_in_hand
