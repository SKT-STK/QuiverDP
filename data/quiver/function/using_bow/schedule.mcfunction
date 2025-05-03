advancement revoke @s only quiver:using_bow

function quiver:_schedule/72eb2512-e677-40e3-9e7b-38bcdc6ef5ae

execute if items entity @s weapon.mainhand bow[enchantments={}] run item modify entity @s weapon.mainhand quiver:remove_glint
enchant @s quiver:quiver
