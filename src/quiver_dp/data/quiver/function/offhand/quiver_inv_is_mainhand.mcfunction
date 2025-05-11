summon item ~ ~1.5 ~ {Tags:["quiver.this"],Item:{id:dirt}}
data modify entity @n[tag=quiver.this] Item set from entity @s SelectedItem
tag @e remove quiver.this
item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand with air
tellraw @s ["", {"text": "[QUIVER] ", "color": "red", "bold": true}, {"text": "You cannot put a bow into your offhand whilst having a quiver in your inventory!", "color": "red"}]
