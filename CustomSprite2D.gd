@tool
class_name CustomSprite2D extends Node2D
## Uses CustomSpriteLayers to display a customizable Sprite

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


@export var layer_config: Array[SpriteLayerConfig] = []
@export var animation_player: AnimationPlayer = null

## Layers
var layers: Array[Node] = []


func _ready():
  child_entered_tree.connect(func(_node): _get_layers())
  _get_layers()

  if layer_config.size():
    set_layers(layer_config)


## Caches a reference to a SpriteLayer2D children
func _get_layers():
  layers = find_children("*", "SpriteLayer2D")
  layers_ready.emit()


## Maps config to all sprite layers.[br]
## Values missing from config will return to defaults.
func set_layers(config: Array[SpriteLayerConfig]):
  for i in layers.size():
    set_layer(layers[i], config[i])


## Maps config to specified sprite layer.[br]
## Values missing from config will return to defaults.
func set_layer(layer: SpriteLayer2D, config: SpriteLayerConfig):
  if layer.title == config.name:
    layer.selected_variant = config.variant_index
    layer.color = config.color


func play_animation(name: String):
  animation_player.play(name)