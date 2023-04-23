extends Control

@export var inventoryPosition: int
@export var equippedItem : PackedScene

var panelItem: UsableItem

func spawn_item():
	assert (equippedItem != null, "ERROR: Plase provide a equipped item in the Godot Editor")

	var equippedItemSpawn = equippedItem.instantiate()
	(equippedItemSpawn as Node2D).scale.x = 2
	(equippedItemSpawn as Node2D).scale.y = 2
	(equippedItemSpawn as Node2D).position.y += 25
	(equippedItemSpawn as Node2D).position.x += 20

	return equippedItemSpawn

func test_usable_item(item: UsableItem) -> bool:
	if (item == null):
		return false
	else:
		return true

func attempt_add_item(usableItem: UsableItem):
	assert (test_usable_item(usableItem) == true, "ERROR: You must provide a scene that subclasses UsableItem class")
	
	add_child(usableItem)
	panelItem = usableItem

func updateInventoryPosition():
	var positionTextControl: Label = self.get_node("InventoryPosition") as Label 
	positionTextControl.text = str(inventoryPosition)

func _ready():
	updateInventoryPosition()

	panelItem = null
	var equippedItemInstance = spawn_item()
	attempt_add_item(equippedItemInstance as UsableItem)
	
	


