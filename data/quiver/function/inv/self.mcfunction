execute store result score @s quiver.count.quiver.1 run clear @s #quiver:quivers[item_model="quiver:quiver_full"] 0
execute store result score @s quiver.count.quiver.2 run clear @s #quiver:quivers[item_model="quiver:quiver_empty"] 0

scoreboard players operation @s quiver.count.quiver.main = @s quiver.count.quiver.1
scoreboard players operation @s quiver.count.quiver.main += @s quiver.count.quiver.2

execute unless score @s quiver.count.quiver.main matches 2.. run return -1

tellraw @s ["", {"text": "[QUIVER] ", "color": "red", "bold": true}, {"text": "You cannot have more then one quiver in your inventory at a time!", "color": "red"}]

execute if score @s quiver.count.quiver.2 matches 1.. positioned ~ ~1.5 ~ run summon item ~ ~ ~ {Tags:["b82872c3-db37-4038-bdee-79bef1d3eacb"],Item:{id:dirt},PickupDelay:40,Motion:[.15d,.15d,.15d]}
execute as @e[tag=b82872c3-db37-4038-bdee-79bef1d3eacb] at @s positioned ~ ~-1.5 ~ run data modify entity @s Item set from entity @p[scores={quiver.count.quiver.2=1..}] Inventory[{components:{"minecraft:item_model":"quiver:quiver_empty"}}]
tag @e[tag=b82872c3-db37-4038-bdee-79bef1d3eacb] remove b82872c3-db37-4038-bdee-79bef1d3eacb
execute if score @s quiver.count.quiver.2 matches 1.. run return run clear @s #quiver:quivers[item_model="quiver:quiver_empty"] 1

execute if score @s quiver.count.quiver.1 matches 1.. positioned ~ ~1.5 ~ run summon item ~ ~ ~ {Tags:["0313e0b2-a118-48c3-9b85-d1589a977e7e"],Item:{id:dirt},PickupDelay:40,Motion:[.15d,.15d,.15d]}
execute as @e[tag=0313e0b2-a118-48c3-9b85-d1589a977e7e] at @s positioned ~ ~-1.5 ~ run data modify entity @s Item set from entity @p[scores={quiver.count.quiver.1=1..}] Inventory[{components:{"minecraft:item_model":"quiver:quiver_full"}}]
tag @e[tag=0313e0b2-a118-48c3-9b85-d1589a977e7e] remove 0313e0b2-a118-48c3-9b85-d1589a977e7e
execute if score @s quiver.count.quiver.1 matches 1.. run return run clear @s #quiver:quivers[item_model="quiver:quiver_full"] 1
