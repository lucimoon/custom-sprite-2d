class_name CustomSpriteConfig extends Resource


@export var layers: Array[SpriteLayerConfig] = []

# func set_layer(layer: SpriteLayerConfig):
#   values[layer_name] = {
#     "color": color,
#     "variant_index": variant_index,
#   }

# func read_layer(layer_name: String):
#   if values.has(layer_name):
#     return values[layer_name]
#   else:
#     return null


# func get_layer_variant(layer_name: String) -> int:
#   if not values.has(layer_name): return 0
#   if not values[layer_name].has('variant_index'): return 0

#   return values[layer_name].variant_index as int


# func get_layer_color(layer_name: String) -> int:
#   if not values.has(layer_name): return 0
#   if not values[layer_name].has('variant_index'): return 0

#   return values[layer_name].variant_index as int


func set_color(layer_name: String, color: Color):
  pass


func set_variant(layer_name: String, variant_index: int):
  pass

# ResourceSaver.save(`{SAVE_PATH}`)