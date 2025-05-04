tag @s add quiver.player3
execute positioned ~ ~1.5 ~ run summon item ~ ~ ~ {Tags:["f9cc935c-0ad0-422d-ba3f-8750a13415dc"],Item:{id:dirt},PickupDelay:40,Motion:[.15d,.15d,.15d]}
execute as @e[tag=f9cc935c-0ad0-422d-ba3f-8750a13415dc] at @s positioned ~ ~-1.5 ~ run data modify entity @s Item set from entity @p[tag=quiver.player3] Inventory[{Slot:-106b}]
tag @e[tag=f9cc935c-0ad0-422d-ba3f-8750a13415dc] remove f9cc935c-0ad0-422d-ba3f-8750a13415dc
tag @s remove quiver.player3
item replace entity @s weapon.offhand with air
