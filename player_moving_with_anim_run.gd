extends CharacterBody2D

@export var walk = 60
@export var run = 2
@onready var animation_tree : AnimationTree = $AnimationTree

var direction : Vector2 = Vector2.ZERO

func _ready():
	animation_tree.active = true

func _process(_delta):
	update_animation_parameters()

func _physics_process(_delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	if direction:
		if (Input.is_action_pressed("ui_accept")):
			velocity = direction * walk * run
		else:
			velocity = direction * walk
	else:
		velocity = Vector2.ZERO
	move_and_slide()

func update_animation_parameters():
	if(velocity == Vector2.ZERO): 
		animation_tree["parameters/conditions/walk_to_idle"] = true
		animation_tree["parameters/conditions/idle_to_walk"] = false
	else:
		animation_tree["parameters/conditions/walk_to_idle"] = false
		animation_tree["parameters/conditions/idle_to_walk"] = true

	if(Input.is_action_pressed("ui_accept")):
		animation_tree["parameters/conditions/walk_to_run"] = true
		animation_tree["parameters/conditions/run_to_walk"] = false	
	else:
		animation_tree["parameters/conditions/run_to_walk"] = true	
		animation_tree["parameters/conditions/walk_to_run"] = false
		
	if(direction != Vector2.ZERO):
		animation_tree["parameters/Idle/blend_position"] = direction
		animation_tree["parameters/Walk/blend_position"] = direction
		animation_tree["parameters/Run/blend_position"] = direction
