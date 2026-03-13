class_name CSLayer
extends Sprite2D

## Displays a texture depending on values of constraints


## Label that identifies this layer (used to match CSLayerConfig.name)
@export var title: String = ""

## Constrains texture index to value of the CSSpriteProperty
@export var texture_constraint: CSSpriteProperty = null

## Constrains modulate value of the texture
## to value of the CSSpriteProperty
@export var color_constraint: CSSpriteProperty = null

## Constrains visibility of the texture
## to value of the CSSpriteProperty
@export var visibility_constraint: CSSpriteProperty = null


## Sets texture_constraint.texture_index; drives the constraint signal chain
var selected_variant: int = 0:
  set(value):
    selected_variant = value
    if texture_constraint != null:
      texture_constraint.texture_index = value

## Sets color_constraint.color; drives the constraint signal chain
var color: Color = Color.WHITE:
  set(value):
    color = value
    if color_constraint != null:
      color_constraint.color = value


@export var textures: Array[Texture2D] = []

## Determines visibility of current layer for
## each value of visibility_constraint.
## If value is missing, layer will not be visible
@export var visibility: Array[bool] = []


func _ready():
  _connect_constraints()


## Updates layer when constraints change
func _connect_constraints():
  if texture_constraint != null:
    texture_constraint.texture_changed.connect(_update_texture)
    _update_texture(texture_constraint.texture_index)

  if visibility_constraint != null:
    visibility_constraint.texture_changed.connect(_update_visibility)
    _update_visibility(visibility_constraint.texture_index)

  if color_constraint != null:
    color_constraint.color_changed.connect(_update_color)
    _update_color(color_constraint.color)


func _update_texture(value: int):
  texture = textures[value]


func _update_visibility(value: int):
  # TODO: Handle missing index error
  visible = visibility[value]


func _update_color(value: Color):
  modulate = value
