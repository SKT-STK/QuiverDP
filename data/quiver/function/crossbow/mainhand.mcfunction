tag @s add quiver.player2
execute positioned ~ ~1.5 ~ run summon item ~ ~ ~ {Tags:["4e021507-3e50-4d0e-89b3-d92ea755f691"],Item:{id:dirt},PickupDelay:40,Motion:[.15d,.15d,.15d]}
execute as @e[tag=4e021507-3e50-4d0e-89b3-d92ea755f691] at @s positioned ~ ~-1.5 ~ run data modify entity @s Item set from entity @p[tag=quiver.player2] SelectedItem
tag @e[tag=4e021507-3e50-4d0e-89b3-d92ea755f691] remove 4e021507-3e50-4d0e-89b3-d92ea755f691
tag @s remove quiver.player2
item replace entity @s weapon.mainhand with air
