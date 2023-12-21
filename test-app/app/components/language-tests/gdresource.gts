import { CodeBlock } from 'ember-shiki';

const codeExample = `
[gd_scene load_steps=7 format=2]

[ext_resource path="res://Example.gd" type="Script" id=1]

[sub_resource type="Environment" id=1]
background_mode = 4
tonemap_mode = 3
glow_enabled = true
glow_blend_mode = 0

[sub_resource type="Animation" id=2]
resource_name = "RESET"
tracks/0/type = "value"
tracks/0/path = NodePath("CanvasLayer/Panel:modulate")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0 ),
"transitions": PoolRealArray( 1 ),
"update": 0,
"values": [ Color( 0, 0, 0, 0 ) ]
}

[sub_resource type="Animation" id=3]
resource_name = "dim"
tracks/0/type = "value"
tracks/0/path = NodePath("CanvasLayer/Panel:modulate")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 1 ),
"transitions": PoolRealArray( 1, 1 ),
"update": 0,
"values": [ Color( 0, 0, 0, 0 ), Color( 0, 0, 0, 0.501961 ) ]
}

[sub_resource type="Animation" id=4]
tracks/0/type = "value"
tracks/0/path = NodePath("CanvasLayer/Panel:modulate")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 1 ),
"transitions": PoolRealArray( 1, 1 ),
"update": 0,
"values": [ Color( 0, 0, 0, 1 ), Color( 0, 0, 0, 0 ) ]
}

[sub_resource type="Animation" id=5]
tracks/0/type = "value"
tracks/0/path = NodePath("CanvasLayer/Panel:modulate")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 1 ),
"transitions": PoolRealArray( 1, 1 ),
"update": 0,
"values": [ Color( 0, 0, 0, 0 ), Color( 0, 0, 0, 1 ) ]
}

[node name="Main" type="Node"]
script = ExtResource( 1 )

[node name="World" type="Node2D" parent="."]

[node name="WorldEnvironment" type="WorldEnvironment" parent="."]
environment = SubResource( 1 )

[node name="CanvasLayer" type="CanvasLayer" parent="."]
layer = 128

[node name="Panel" type="Panel" parent="CanvasLayer"]
modulate = Color( 0, 0, 0, 0 )
anchor_right = 1.0
anchor_bottom = 1.0
mouse_filter = 2
__meta__ = {
"_edit_use_anchors_": false
}

[node name="FadePlayer" type="AnimationPlayer" parent="."]
anims/RESET = SubResource( 2 )
anims/dim = SubResource( 3 )
anims/fade_in = SubResource( 4 )
anims/fade_out = SubResource( 5 )

; from https://github.com/godotengine/godot-vscode-plugin/blob/cdc550a412dfffd26dfe7351e429b73c819d68d0/syntaxes/examples/Example.tscn`;

<template>
  <CodeBlock @code={{codeExample}} @language="gdresource" />
</template>
