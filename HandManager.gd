extends Node2D

var item: Card
var hovering: Card
var handName: String
var keys: Array[Key]
var color: Color

const Up: int = 0
const Down: int = 1
const Left: int = 2
const Right: int = 3
const Interact: int = 4

func _get_sorted_cards() -> Array:
	var cards: Array[Card] = []
	for node in get_tree().get_nodes_in_group("Cards"):
		if not node.inHand:
			cards.append(node)
	cards.sort_custom(func(a, b): return a.global_position.x < b.global_position.x)
	return cards

func _set_hover(card: Area2D, is_hovering: bool) -> void:
	if is_hovering:
		card.modulate = color
	else:
		card.modulate = Color.WHITE

func _up():
	print(handName, ", Up")

func _down():
	print(handName, ", Down")

func _left():
	if hovering == null:
		var cards = _get_sorted_cards()
		hovering = cards[len(cards) - 1]
		_set_hover(hovering, true)
		print("hovering ",hovering)
	else:
		var cards = _get_sorted_cards()
		var current_index = cards.find(hovering)
		_set_hover(hovering, false)
		if current_index > 0:
			hovering = cards[current_index - 1]
		else:
			hovering = cards[len(cards) - 1]
		_set_hover(hovering, true)
		print("hovering ",hovering)
		
func _right():
	if hovering == null:
		var cards = _get_sorted_cards()
		hovering = cards[0]
		_set_hover(hovering, true)
		print("hovering ",hovering)
	else:
		var cards = _get_sorted_cards()
		var current_index = cards.find(hovering)
		_set_hover(hovering, false)
		if current_index < len(cards) - 1:
			hovering = cards[current_index + 1]
		else:
			hovering = cards[0]
		_set_hover(hovering, true)
		print("hovering ",hovering)

func _interact():
	if hovering != null:
		var new_item = hovering._interact(item)
		if new_item != item:
			item = new_item
			hovering = null
			print(handName, " now has ", item)
	else:
		print(handName, ", nothing to interact with")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey && event.is_pressed():
		print(event)
		if event.keycode == keys[Up]:
			_up()
		elif event.keycode == keys[Down]:
			_down()
		elif event.keycode == keys[Left]:
			_left()
		elif event.keycode == keys[Right]:
			_right()
		elif event.keycode == keys[Interact]:
			_interact()
		else:
			pass
		
