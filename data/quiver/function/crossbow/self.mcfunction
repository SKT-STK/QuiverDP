advancement revoke @s only quiver:using_crossbow

execute unless items entity @s container.* #quiver:quivers[item_model="quiver:quiver_full"] run return -1

tellraw @s ["", {"text": "[QUIVER] ", "color": "red", "bold": true}, {"text": "You cannot use a crossbow whilst having a loaded quiver on your inventory!", "color": "red"}]

execute if items entity @s weapon.mainhand crossbow run return run function quiver:crossbow/mainhand
execute if items entity @s weapon.offhand crossbow run return run function quiver:crossbow/offhand
