execute in quiver:quiver_forceload run forceload add 0 0
execute in quiver:quiver_forceload run item replace block 0 3 0 container.0 from entity @s weapon.offhand
item replace entity @s weapon.offhand from entity @s weapon.mainhand
execute in quiver:quiver_forceload run item replace entity @s weapon.mainhand from block 0 3 0 container.0
execute in quiver:quiver_forceload run forceload remove all
tellraw @s ["", {"text": "[QUIVER] ", "color": "red", "bold": true}, {"text": "You cannot put a quiver into your offhand, nor a bow there whilst having a quiver in your inventory!", "color": "red"}]
