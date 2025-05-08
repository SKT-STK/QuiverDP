tag @s add quiver.player
execute positioned ~ ~1.5 ~ run summon item ~ ~ ~ {Tags:["5dc9b315-a14e-43c3-bcee-79af7833cb13"],Item:{id:dirt}}
execute as @e[tag=5dc9b315-a14e-43c3-bcee-79af7833cb13] at @s positioned ~ ~-1.5 ~ run data modify entity @s Item set from entity @p[tag=quiver.player] SelectedItem
tag @e[tag=5dc9b315-a14e-43c3-bcee-79af7833cb13] remove 5dc9b315-a14e-43c3-bcee-79af7833cb13
tag @s remove quiver.player
item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand with air
tellraw @s ["", {"text": "[QUIVER] ", "color": "red", "bold": true}, {"text": "You cannot put a bow into your offhand whilst having a quiver in your inventory!", "color": "red"}]
