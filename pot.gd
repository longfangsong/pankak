extends Card

var paste: bool = false
@onready var label = $Label

func _set_paste(value: bool):
	paste = value
	if value:
		label.text = "满"
	else:
		label.text = "空"

func _interact(current_in_hand: Card) -> Card:
	if current_in_hand is Spoon:
		current_in_hand._set_paste(false)
		_set_paste(true)
	elif current_in_hand is Shovel:
		_set_paste(false)
	return current_in_hand
