summon item ~ ~ ~ {Tags:["quiver.item"],PickupDelay:-1,Item:{id:dirt}}
item replace entity @n[tag=quiver.item] contents from entity @s weapon.offhand
item replace entity @s weapon.offhand from entity @s weapon.mainhand
item replace entity @s weapon.mainhand from entity @n[tag=quiver.item] contents
kill @e[tag=quiver.item]

tellraw @s ["", {"text": "[QUIVER] ", "color": "red", "bold": true}, {"text": "You cannot put a quiver into your offhand, nor a bow there whilst having a quiver in your inventory!", "color": "red"}]
