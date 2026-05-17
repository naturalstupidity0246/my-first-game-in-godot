extends Area2D

@onready var sound: AudioStreamPlayer2D = $death_sound
@onready var player: CharacterBody2D = %player

@onready var timer: Timer = $Timer
func _on_body_entered(body: CharacterBody2D = player) -> void:
	print("death")
	#play hurt sound
	var audio = "res://assets/sounds/hurt.wav";
	sound.stream = load(audio);
	sound.play()
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0;
	get_tree().reload_current_scene()
