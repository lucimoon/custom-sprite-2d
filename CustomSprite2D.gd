@tool
class_name CustomSprite2D extends Node2D

## Uses CustomSpriteLayers to display a customizable Sprite


## Global sprite animation parameters
@export var h_frames: int:
  set(value):
      get_layers_in_editor()

      for layer in layers:
        layer.hframes = value

      h_frames = value

@export var v_frames: int:
  set(value):
      get_layers_in_editor()

      for layer in layers:
        layer.vframes = value

      v_frames = value

@export var frame: int:
  set(value):
      get_layers_in_editor()

      for layer in layers:
        layer.frame = value

      frame = value

@export var frame_coords: Vector2i:
  set(value):
      get_layers_in_editor()

      for layer in layers:
        layer.frame_coords= value

      frame_coords = value

var layers: Array[Node] = []


func get_layers():
    layers = find_children("*", "CustomSpriteLayer2D")

## Convenience method to find children in editor only
func get_layers_in_editor():
  if (Engine.is_editor_hint()):
    get_layers()