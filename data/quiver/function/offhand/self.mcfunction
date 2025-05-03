advancement revoke @s only quiver:inv_changed
function quiver:inv/self

execute unless function quiver:offhand/check run return -1

execute in quiver:quiver_forceload run forceload add 0 0
execute in quiver:quiver_forceload run setblock 0 3 0 decorated_pot
execute in quiver:quiver_forceload run item replace block 0 3 0 container.0 from entity @s weapon.offhand
item replace entity @s weapon.offhand from entity @s weapon.mainhand
execute in quiver:quiver_forceload run item replace entity @s weapon.mainhand from block 0 3 0 container.0
execute in quiver:quiver_forceload run forceload remove all
