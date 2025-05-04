function quiver:_schedule/0fca588e-2c51-4150-ab07-1eaf3899d55c

execute unless predicate quiver:is_sneaking run return -1
execute unless items entity @s weapon.offhand #minecraft:arrows run return -1

function quiver:shot_arrow/arrows_count
execute store result score @s quiver.count.arrow run data get storage quiver:quiver count
execute if score @s quiver.count.arrow matches 191.. run return -1

execute in quiver:quiver_forceload run forceload add 0 0
execute in quiver:quiver_forceload run item replace block 0 2 0 container.0 from entity @s weapon.mainhand
execute in quiver:quiver_forceload run data modify block 0 2 0 item.id set value "minecraft:arrow"
execute in quiver:quiver_forceload run data modify block 0 2 0 item.components."minecraft:max_stack_size" set value 1
execute in quiver:quiver_forceload run data modify block 0 2 0 item.components."minecraft:item_model" set value "quiver:quiver_full"
execute in quiver:quiver_forceload run data modify block 0 2 0 item.components."minecraft:item_name" set value "\"Arrow Quiver\""
execute in quiver:quiver_forceload run data modify block 0 2 0 item.components."minecraft:custom_data"."quiver.arrows" append from entity @s Inventory[{Slot:-106b}]
execute if score @s quiver.count.arrow matches ..61 in quiver:quiver_forceload run data modify block 0 2 0 item.components."minecraft:damage" set value 75
execute if score @s quiver.count.arrow matches 62..125 in quiver:quiver_forceload run data modify block 0 2 0 item.components."minecraft:damage" set value 50
execute if score @s quiver.count.arrow matches 126..188 in quiver:quiver_forceload run data modify block 0 2 0 item.components."minecraft:damage" set value 30
execute if score @s quiver.count.arrow matches 189.. in quiver:quiver_forceload run data modify block 0 2 0 item.components."minecraft:damage" set value 1
execute in quiver:quiver_forceload run item replace entity @s weapon.mainhand from block 0 2 0 container.0
execute in quiver:quiver_forceload run forceload remove all
scoreboard players operation @s quiver.count.arrow += %2 quiver.CONST
item modify entity @s weapon.offhand quiver:reduce_count_1
execute store result storage quiver:quiver count int 1 run scoreboard players get @s quiver.count.arrow
function quiver:replenish/self_m with storage quiver:quiver
execute at @s run playsound minecraft:item.armor.equip_generic master @a ~ ~ ~ 1 1
