tellraw @a "Quiver Datapack Loaded Successfully!"

scoreboard objectives add quiver.BOOL.is_spectral dummy
scoreboard objectives add quiver.count.arrows dummy
scoreboard objectives add quiver.count.full_quiver dummy
scoreboard objectives add quiver.CONST dummy
scoreboard objectives add quiver.using.bow dummy
scoreboard objectives add quiver.using.crossbow dummy
scoreboard objectives add quiver.pos.x dummy
scoreboard objectives add quiver.pos.z dummy

scoreboard players reset * quiver.CONST

scoreboard players set #1 quiver.CONST 1
scoreboard players set #-1 quiver.CONST -1

gamerule maxCommandChainLength 2147483647
