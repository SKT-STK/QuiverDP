execute unless items entity @s container.* #quiver:quivers[item_model="quiver:quiver_full"] run return run advancement revoke @s only quiver:using_crossbow

execute unless score @s quiver.using.crossbow matches 1.. run function quiver:crossbow/self

advancement revoke @s only quiver:using_crossbow
advancement revoke @s only quiver:stop_using_crossbow_tick
scoreboard players set @s quiver.using.crossbow 2
