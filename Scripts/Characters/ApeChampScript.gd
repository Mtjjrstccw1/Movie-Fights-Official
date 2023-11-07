extends CharacterBody2D

#Globals Variables
var frame = 0
@export var id: int

#Ground Variables
var dash_duration = 10


#Onready Variables
@onready var GroundL = get_node('Raycasts/GroundL')
@onready var GroundR = get_node('Raycasts/GroundR')
@onready var states = $State
@onready var sprite = $Sprite2D
@onready var anim = $AnimationPlayer

#FOX's main attributes
var RUNSPEED = 340 *2
var DASHSPEED = 390 *2
var WALKSPEED = 200 *2
var GRAVITY = 1800 *2
var JUMPFORCE = 500 *2
var MAX_JUMPFORCE = 800 *2
var DOUBLEJUMPFORCE = 1000 *2
var MAXAIRSPEED = 300 *2
var AIR_ACCEL = 25 *2
var FALLSPEED = 60 *2
var FALLINGSPEED = 900 *2
var MAXFALLSPEED = 900 *2
var TRACTION = 40 *2
var ROLL_DISTANCE = 350 *2
var air_dodge_speed = 500 *2
var UP_B_LAUNCHSPEED = 700 *2


func updateframes(delta):
	frame += floor(delta *60)

func turn(direction):
	var dir = 0
	if direction:
		dir = -1
	else:
		dir = 1
	$AnimatedSprite2D.set_flip_h(direction)
	$"442134619131871244".set_flip_h(direction)
	
func frames():
	frame = 0
	
func play_animation(animation_name):
	anim.play(animation_name)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

func _physics_process(delta):
	pass

