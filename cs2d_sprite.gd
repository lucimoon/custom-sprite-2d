@tool
class_name CSSprite extends Node2D
## Uses CustomCSLayers to display a customizable Sprite

## Signals
signal layers_ready()

## Global sprite animation parameters

## Horizontal frames for all child textures
@export var h_frames: int:
  set(value):
    for layer in layers:
      layer.hframes = value

    h_frames = value


## Vertical frames for all child textures
@export var v_frames: int:
  set(value):
    for layer in layers:
      layer.vframes = value

    v_frames = value


## Current frame for all child textures
@export var frame: int:
  set(value):
    for layer in layers:
      layer.frame = value

    frame = value


## Current frame coordinates for all child textures
@export var frame_coords: Vector2i:
  set(value):
    for layer in layers:
      layer.frame_coords = value

    frame_coords = value


@export var layer_config: Array[CSLayerConfig] = []
@export_node_path("AnimationPlayer") var animation_player_path: NodePath = NodePath("")


## Properties
var properties: Array[Node] = []

## Layers
var layers: Array[Node] = []


func _ready():
  child_entered_tree.connect(func(_node): _get_layers())
  _get_properties()
  _get_layers()


## Caches a reference to all CSSpriteProperty children
func _get_properties():
  if properties.size() > 0: return properties

  properties = find_children("*", "CSSpriteProperty")


## Caches a reference to all CSLayer children
func _get_layers():
  layers = find_children("*", "CSLayer")
  layers_ready.emit.call_deferred()


## Maps config to all sprite layers.[br]
## Values missing from config will return to defaults.
func set_layers(config: Array[CSLayerConfig]):
  for i in layers.size():
    set_layer(layers[i], config[i])


## Maps config to specified sprite layer.[br]
## Values missing from config will return to defaults.
func set_layer(layer: CSLayer, config: CSLayerConfig):
  if layer.title == config.name:
    layer.selected_variant = config.variant_index
    layer.color = config.color


func play_animation(animation: String):
  if animation_player_path.is_empty(): return
  var player := get_node(animation_player_path) as AnimationPlayer
  if player:
    player.play(animation)


## Sets property values by name
func set_property_by_name(name: String, color: Color, textureIndex: int):
  _get_properties()

  var propertyIndex := properties.find_custom(func(prop):
    if prop is not CSSpriteProperty: return false

    return prop.ui_name == name
  )

  var property = properties[propertyIndex]

  if property is CSSpriteProperty:
    property.color = color
    property.texture_index = textureIndex
