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
      layer.frame_coords= value

    frame_coords = value


@export var layer_config: Array[CSLayerConfig] = []
@export var animation_player: AnimationPlayer = null


## Properties
var properties: Array[Node] = []

## Layers
var layers: Array[Node] = []


func _ready():
  child_entered_tree.connect(func(_node): _get_layers())
  _get_properties()
  _get_layers()

  # if layer_config.size():
  #   set_layers(layer_config)


## Caches a reference to all CSSpriteProperty children
func _get_properties():
  properties = find_children("*", "CSSpriteProperty")


## Caches a reference to all CSLayer children
func _get_layers():
  layers = find_children("*", "CSLayer")
  layers_ready.emit()


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
  animation_player.play(animation)
