@tool
class_name CustomSprite2D extends Node2D
## Uses CustomSpriteLayers to display a customizable Sprite

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

var layers: Array[Node] = []


func _ready():
  child_entered_tree.connect(func(_node): _get_layers())
  _get_layers()


## Caches a reference to a SpriteLayer2D children
func _get_layers():
  layers = find_children("*", "SpriteLayer2D")
