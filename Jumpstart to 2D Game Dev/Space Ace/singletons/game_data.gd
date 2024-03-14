extends Node

enum ENEMY_TYPE { ZIPPER, BIO, BOMBER }
enum POWERUP_TYPE { HEALTH, SHIELD }
const GROUP_PLAYER: String = "player"
const GROUP_HOMING_MISSILE: String = "homing_missile"
const GROUP_SAUCER: String = "saucer"
const ENEMY_SHIP: String = "enemy_ship"
const ENEMY_BULLET: String = "enemy_bullet"
const MISSILE_DAMAGE: int = 10
const COLLISION_DAMAGE: int = 40

const POWER_UPS = {
	POWERUP_TYPE.HEALTH: preload("res://assets/misc/powerupGreen_bolt.png"),
	POWERUP_TYPE.SHIELD: preload("res://assets/misc/shield_gold.png")
}
