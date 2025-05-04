advancement revoke @s only quiver:using_bow

function quiver:_schedule/c7886d51-37af-4e0f-b409-b5e84859fac4

execute if items entity @s weapon.mainhand bow[enchantments={}] run item modify entity @s weapon.mainhand quiver:remove_glint
enchant @s quiver:quiver
