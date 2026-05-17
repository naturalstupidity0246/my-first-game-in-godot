extends Node

@onready var bgmusic: AudioStreamPlayer2D = %sound
var audio = 0;
@onready var killzone: Area2D = %killzone
@onready var player: CharacterBody2D = %player

func _ready() -> void:
	audio = "res://assets/music/time_for_adventure.mp3"
	bgmusic.stream = load(audio)
	bgmusic.play()
