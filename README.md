# Custom Character 2D

Custom Character 2D is a plugin for Godot 4.2+ that simplifies creating customizable character sprites for 2D games.
It may work for versions below 4.2, but it has only been tested for 4.2 so far.

# Guide

There are 3 nodes that make up this library, `CustomSprite2D`, `SpriteLayer2D` & `VariantTexture2D`.

The node hierarchy is as follows:
`CustomSprite2D` -> `SpriteLayer2D` -> `VariantTexture2D`

## Nodes

### CustomSprite2D

`CustomSprite2D` exposes values similar to the animation property of `Sprite2D`. When these are updated in the editor, the corresponding properties are updated for each `SpriteLayer2D`. This allows the `AnimationPlayer` component to be used to animate all layers of the sprite without needing to manually keyframe each layer to for every animation.

You'll still need to create unique animations for your character, since the number of frames, speed, and other properties will be unique to your animations. This just keeps everything in sync!

### SpriteLayer2D

`SpriteLayer2D` represents a customizable sprite layer. You might want a layer for a body, tops, bottoms, hair or even accessories! It's up to you how to break your character into layers. This layer controls which `VariantTexture2D` is displayed & what color is modulates the layer texture.

### VariantTexture2D

`VariantTexture2D` represents the actual texture displayed for a given layer. It also exposes a title, which can be used in the UI, if needed.

## Textures

To get the most flexibility out of your textures, they should be created in gray scale. Modulating a color on pure white will display the true color. Pure black will remain black, unchanged. Experiment with different tones to find the values give you the flexibility you want.
