tag @s add quiver.player
execute positioned ~ ~1.5 ~ run summon item ~ ~ ~ {Tags:["ef9d4f05-4881-407e-83de-9e0208c2cb1d"],Item:{id:dirt}}
execute as @e[tag=ef9d4f05-4881-407e-83de-9e0208c2cb1d] at @s positioned ~ ~-1.5 ~ run data modify entity @s Item set from entity @p[tag=quiver.player] SelectedItem
tag @e[tag=ef9d4f05-4881-407e-83de-9e0208c2cb1d] remove ef9d4f05-4881-407e-83de-9e0208c2cb1d
tag @s remove quiver.player
item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand with air
tellraw @s ["", {"text": "[QUIVER] ", "color": "red", "bold": true}, {"text": "You cannot put a bow into your offhand whilst having a quiver in your inventory!", "color": "red"}]
