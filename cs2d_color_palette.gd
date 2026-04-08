@tool
class_name CS2DColorPalette extends Resource

## Paste a comma-separated list of hex colors to append to the colors array.
@export var color_string: String:
  set(value):
    if Engine.is_editor_hint():
      for hex in value.split(",", false):
        colors.append(Color(hex.strip_edges()))

@export var colors: Array[Color] = []

func is_empty():
  return colors.is_empty()

func size():
  return colors.size()
