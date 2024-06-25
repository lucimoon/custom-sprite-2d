@tool
class_name SpriteLayer2D extends Sprite2D
## A child of CustomSprite2D
## Defines a sprite layer whose animations
## are synced with sibling layers

@export var title: String = "Layer"

## Color modulates sprite texture to support
## color variations for the same sprite
@export var color: Color = Color(1, 1, 1, 1):
  set(value):
    color = value
    _set_color(value)


## A curated list of colors associated with this layer.[br]
## Colors are unused, within the layer, but are
## associated with this layer and helpful for assisting a
## player with choosing a color within the game's palette.
@export var preset_colors: Array[Color] = []

## Index of variant to display.
## Cannot be greater than maximum index of variants.
@export var selected_variant: int = 0:
  set(value):
    var max_index = variants.size() - 1

    if (value > max_index):
      selected_variant = max_index
    else:
      selected_variant = value

    if max_index >= 0: _set_texture()

## At least one variant is needed per layer.
## The first variant will be the default option
var variants: Array[Node] = []


func _ready():
  child_entered_tree.connect(func (_node): _get_variants())
  _get_variants()

## Caches a reference to a VariantTexture2D children
func _get_variants():
  variants = find_children("*", "VariantTexture2D")


## Changes color of selected variant
func _set_color(value: Color):
  modulate = value


# Displays selected variant
func _set_texture():
  texture = variants[selected_variant].texture