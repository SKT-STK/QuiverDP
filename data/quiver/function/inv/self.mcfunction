execute store result score @s quiver.count.quiver.1 run clear @s #quiver:quivers[item_model="quiver:quiver_full"] 0
execute store result score @s quiver.count.quiver.2 run clear @s #quiver:quivers[item_model="quiver:quiver_empty"] 0

scoreboard players operation @s quiver.count.quiver.main = @s quiver.count.quiver.1
scoreboard players operation @s quiver.count.quiver.main += @s quiver.count.quiver.2

execute unless score @s quiver.count.quiver.main matches 2.. run return -1

execute if score @s quiver.count.quiver.2 matches 1.. positioned ~ ~1.5 ~ run summon item ~ ~ ~ {Tags:["b93d5575-44e0-45d3-831c-f32a7a8876ee"],Item:{id:dirt},PickupDelay:40,Motion:[.15d,.15d,.15d]}
execute as @e[tag=b93d5575-44e0-45d3-831c-f32a7a8876ee] at @s positioned ~ ~-1.5 ~ run data modify entity @s Item set from entity @p[scores={quiver.count.quiver.2=1..}] Inventory[{components:{"minecraft:item_model":"quiver:quiver_empty"}}]
tag @e[tag=b93d5575-44e0-45d3-831c-f32a7a8876ee] remove b93d5575-44e0-45d3-831c-f32a7a8876ee
execute if score @s quiver.count.quiver.2 matches 1.. run return run clear @s #quiver:quivers[item_model="quiver:quiver_empty"] 1

execute if score @s quiver.count.quiver.1 matches 1.. positioned ~ ~1.5 ~ run summon item ~ ~ ~ {Tags:["64242c8d-0a8c-4121-890a-9bbe128de7b3"],Item:{id:dirt},PickupDelay:40,Motion:[.15d,.15d,.15d]}
execute as @e[tag=64242c8d-0a8c-4121-890a-9bbe128de7b3] at @s positioned ~ ~-1.5 ~ run data modify entity @s Item set from entity @p[scores={quiver.count.quiver.1=1..}] Inventory[{components:{"minecraft:item_model":"quiver:quiver_full"}}]
tag @e[tag=64242c8d-0a8c-4121-890a-9bbe128de7b3] remove 64242c8d-0a8c-4121-890a-9bbe128de7b3
execute if score @s quiver.count.quiver.1 matches 1.. run return run clear @s #quiver:quivers[item_model="quiver:quiver_full"] 1
