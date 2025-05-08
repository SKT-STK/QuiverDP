execute store result score @s quiver.count.quiver.1 run clear @s #quiver:quivers[item_model="quiver:quiver_full"] 0
execute store result score @s quiver.count.quiver.2 run clear @s #quiver:quivers[item_model="quiver:quiver_empty"] 0

scoreboard players operation @s quiver.count.quiver.main = @s quiver.count.quiver.1
scoreboard players operation @s quiver.count.quiver.main += @s quiver.count.quiver.2

execute unless score @s quiver.count.quiver.main matches 2.. run return -1

tellraw @s ["", {"text": "[QUIVER] ", "color": "red", "bold": true}, {"text": "You cannot have more then one quiver in your inventory at a time!", "color": "red"}]

execute if score @s quiver.count.quiver.2 matches 1.. positioned ~ ~1.5 ~ run summon item ~ ~ ~ {Tags:["e17c3af5-bde2-405f-bdaf-8de8cd7524b7"],Item:{id:dirt},PickupDelay:40,Motion:[.15d,.15d,.15d]}
execute as @e[tag=e17c3af5-bde2-405f-bdaf-8de8cd7524b7] at @s positioned ~ ~-1.5 ~ run data modify entity @s Item set from entity @p[scores={quiver.count.quiver.2=1..}] Inventory[{components:{"minecraft:item_model":"quiver:quiver_empty"}}]
tag @e[tag=e17c3af5-bde2-405f-bdaf-8de8cd7524b7] remove e17c3af5-bde2-405f-bdaf-8de8cd7524b7
execute if score @s quiver.count.quiver.2 matches 1.. run return run clear @s #quiver:quivers[item_model="quiver:quiver_empty"] 1

execute if score @s quiver.count.quiver.1 matches 1.. positioned ~ ~1.5 ~ run summon item ~ ~ ~ {Tags:["45fb6b37-bef9-482c-aa7d-be0f78e5c564"],Item:{id:dirt},PickupDelay:40,Motion:[.15d,.15d,.15d]}
execute as @e[tag=45fb6b37-bef9-482c-aa7d-be0f78e5c564] at @s positioned ~ ~-1.5 ~ run data modify entity @s Item set from entity @p[scores={quiver.count.quiver.1=1..}] Inventory[{components:{"minecraft:item_model":"quiver:quiver_full"}}]
tag @e[tag=45fb6b37-bef9-482c-aa7d-be0f78e5c564] remove 45fb6b37-bef9-482c-aa7d-be0f78e5c564
execute if score @s quiver.count.quiver.1 matches 1.. run return run clear @s #quiver:quivers[item_model="quiver:quiver_full"] 1
