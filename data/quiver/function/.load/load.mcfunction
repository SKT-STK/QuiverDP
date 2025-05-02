tellraw @a "Quiver Datapack Loaded Successfully!"

scoreboard objectives add quiver.BOOL.is_spectral dummy
scoreboard objectives add quiver.count.arrow dummy
scoreboard objectives add quiver.CONST dummy

scoreboard players reset * quiver.CONST

scoreboard players set %2 quiver.CONST 2

execute in quiver:quiver_forceload run forceload remove all
