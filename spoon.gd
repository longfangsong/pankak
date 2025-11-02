class_name Spoon
extends Card

var paste: bool = false
@onready var label = $Label

func _interact(current_in_hand: Card) -> Card:
	if current_in_hand == null:
		inHand = true
		global_position.y += 100
		return self
	return current_in_hand

func _set_paste(value: bool):
	paste = value
	if value:
		label.text = "满"
	else:
		label.text = "空"
