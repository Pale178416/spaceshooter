extends Node2D
@onready var left_muzzel: Marker2D = $LeftMuzzel
@onready var right_muzzel: Marker2D = $RightMuzzel
@onready var spawner_component: SpawnerComponent = $SpawnerComponent as SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var move_component: MoveComponent = $MoveComponent as MoveComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $Anchor/AnimatedSprite2D as AnimatedSprite2D
@onready var flame_animated_sprite_2d: AnimatedSprite2D = $Anchor/FlameAnimatedSprite2D
@onready var hurt_component: HurtComponent = $HurtComponent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fire_rate_timer.timeout.connect(fire_laser)
	pass # Replace with function body.
func _process(_delta: float) -> void:
	animate_the_ship()
func fire_laser()->void:
	spawner_component.spawn(left_muzzel.global_position)
	spawner_component.spawn(right_muzzel.global_position)
	scale_component.tween_scale()
	
func animate_the_ship() -> void:
	if move_component.velocity.x<0:
		animated_sprite_2d.play("bank_left")
		flame_animated_sprite_2d.play("left")
	elif move_component.velocity.x>0:
		animated_sprite_2d.play("bank_right")
		flame_animated_sprite_2d.play("right")
	else:
		animated_sprite_2d.play("centre")
		flame_animated_sprite_2d.play("centre")
	
