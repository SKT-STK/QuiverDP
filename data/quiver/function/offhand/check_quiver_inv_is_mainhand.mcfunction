execute if items entity @s container.* #quiver:quivers[item_model="quiver:quiver_full"] if items entity @s weapon.offhand bow if items entity @s weapon.mainhand #quiver:quivers[item_model="quiver:quiver_full"] run return 1
execute if items entity @s container.* #quiver:quivers[item_model="quiver:quiver_empty"] if items entity @s weapon.offhand bow if items entity @s weapon.mainhand #quiver:quivers[item_model="quiver:quiver_empty"] run return 1
return fail
