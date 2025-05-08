execute unless data entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}].components."minecraft:custom_data"."quiver.arrows"[0] run return run advancement revoke @s only quiver:using_bow

execute unless score @s quiver.using.bow matches 1.. run function quiver:using_bow/self

advancement revoke @s only quiver:using_bow
advancement revoke @s only quiver:stop_using_bow_tick
scoreboard players set @s quiver.using.bow 2
