class_name HitBox
extends Area2D

var parent = get_parent()
@export var width = 300
@export var height = 400
@export var damageValue = 10
@export var angle = 50
@export var knockback = 100
@export var duration = 1500
@export var hitlagMod = 1
@export var damageType = 0
@export var angleFlipper = 0
@onready var hitbox = get_node("Hitbox Shape")
@onready var parentState = get_parent().selfState
var knockbackValue
var framez = 0.0
var playerList = []

func set_parameters(wdt,hgt,dmg,agl,kbk,dur,lag,typ,afl,pos,parent = get_parent()):
	self.position = Vector2(0,0)
	playerList.append(parent)
	playerList.append(self)
	width = wdt
	height = hgt
	damageValue = dmg
	angle = agl
	knockback = kbk
	duration = dur
	hitlagMod = lag
	damageType = typ
	angleFlipper = afl
	self.position = pos
	update_extents()
	hitbox.area_entered.connect(_on_area_entered)
	set_physics_process(true)

func update_extents():
	hitbox.shape.extents = Vector2(width,height)


func _on_area_entered(area):
	pass # Replace with function body.
