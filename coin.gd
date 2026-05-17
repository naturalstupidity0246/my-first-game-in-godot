extends Area2D

@onready var game_manager = %game_manager
@onready var player: CharacterBody2D = %player

func _on_body_entered(body: CharacterBody2D = player) -> void:
	player.add_coins()
	queue_free()
