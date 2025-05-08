execute unless items entity @s container.* #quiver:quivers[item_model="quiver:quiver_full"] run return -1

scoreboard players remove @s quiver.using.crossbow 1
execute if score @s quiver.using.crossbow matches 1.. run return run advancement revoke @s only quiver:stop_using_crossbow_tick
scoreboard players set @s quiver.using.crossbow 0

data modify storage quiver:quiver slot set from entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}].Slot
function quiver:crossbow/stop_tick_m with storage quiver:quiver
