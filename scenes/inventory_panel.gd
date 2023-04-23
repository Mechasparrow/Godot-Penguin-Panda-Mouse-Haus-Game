extends Control

@export var inventoryPosition: int
@export var equippedItem : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var positionTextControl: Label = self.get_node("InventoryPosition") as Label 
	print(positionTextControl)
	positionTextControl.text = str(inventoryPosition)

	var equippedItemSpawn = equippedItem.instantiate()
	(equippedItemSpawn as Node2D).scale.x = 2
	(equippedItemSpawn as Node2D).scale.y = 2
	(equippedItemSpawn as Node2D).position.y += 25
	(equippedItemSpawn as Node2D).position.x += 20
	
	add_child(equippedItemSpawn)


