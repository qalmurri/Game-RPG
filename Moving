extends CharacterBody2D

@export var speed = 60
@onready var animation_tree : AnimationTree = $AnimationTree

var direction : Vector2 = Vector2.ZERO

func _ready():
    animation_tree.active = true

func _process(delta):
    update_animation_parameters()

func _physics_process(delta):
    direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
    if direction:
        velocity = direction * speed
    else:
        velocity = Vector2.ZERO    
    move_and_slide()

func update_animation_parameters():
    if(velocity == Vector2.ZERO):
        animation_tree["parameters/conditions/idle"] = true
        animation_tree["parameters/conditions/is_moving"] = false
    else:
        animation_tree["parameters/conditions/idle"] = false
        animation_tree["parameters/conditions/is_moving"] = true
    
    if(direction != Vector2.ZERO):
        animation_tree["parameters/Idle/blend_position"] = direction
        animation_tree["parameters/Walk/blend_position"] = direction
