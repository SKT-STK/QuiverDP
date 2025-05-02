advancement revoke @s only quiver:using_bow

function quiver:_schedule/71172087-6533-43e3-9eb9-6b4cf3ed4c21

execute if items entity @s weapon.mainhand bow[enchantments={}] run item modify entity @s weapon.mainhand quiver:remove_glint
enchant @s quiver:quiver
