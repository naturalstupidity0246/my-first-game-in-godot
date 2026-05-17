extends CharacterBody2D


const SPEED = 180.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var sound: AudioStreamPlayer2D = $sound
var audio = 0;

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		var audio = "res://assets/sounds/jump.wav"
		sound.stream = load(audio);
		sound.play()
		print("you jumped!")

	# Get the input direction dattebayo!
	var direction := Input.get_axis("move_left", "move_right")
	
	#flips the sprite
	if direction < 0: 
		animated_sprite.flip_h = true;
	elif direction  > 0: 
		animated_sprite.flip_h = false;
	
	#play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("walk")
	else:
		animated_sprite.play("jump")
	
	#apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
#COIN SYSTEM
var coins = 0;
	#adding points
func add_coins():
	coins += 1
	audio = "res://assets/sounds/coin.wav"
	sound.stream = load(audio)
	sound.play()
	print(coins)
