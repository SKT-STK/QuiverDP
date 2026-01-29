tag @s add quiver.replenish_schedule
function(2t):
  execute as @a[tag=quiver.replenish_schedule]:
    advancement revoke @s only quiver:using_quiver
    tag @s remove quiver.replenish_schedule


execute unless predicate quiver:is_sneaking run return -1
execute unless items entity @s weapon.offhand #minecraft:arrows run return -1

execute store result score @s quiver.count.arrows run data get entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}].components."minecraft:custom_data"."quiver.arrows"
execute if score @s quiver.count.arrows matches 192.. run return -1

summon item ~ ~ ~ {Tags:["quiver.item"],PickupDelay:-1,Item:{id:dirt}}
item replace entity @n[tag=quiver.item] contents from entity @s weapon.mainhand
data modify entity @n[tag=quiver.item] Item.id set value "minecraft:arrow"
data modify entity @n[tag=quiver.item] Item.components."minecraft:max_stack_size" set value 1
data modify entity @n[tag=quiver.item] Item.components."minecraft:item_model" set value "quiver:quiver_full"
data modify entity @n[tag=quiver.item] Item.components."minecraft:item_name" set value "Arrow Quiver"
data modify entity @n[tag=quiver.item] Item.components."minecraft:custom_data"."quiver.arrows" append from entity @s equipment.offhand
execute if score @s quiver.count.arrows matches ..61 run data modify entity @n[tag=quiver.item] Item.components."minecraft:damage" set value 75
execute if score @s quiver.count.arrows matches 62..125 run data modify entity @n[tag=quiver.item] Item.components."minecraft:damage" set value 50
execute if score @s quiver.count.arrows matches 126..188 run data modify entity @n[tag=quiver.item] Item.components."minecraft:damage" set value 30
execute if score @s quiver.count.arrows matches 189.. run data modify entity @n[tag=quiver.item] Item.components."minecraft:damage" set value 1
item replace entity @s weapon.mainhand from entity @n[tag=quiver.item] contents
kill @e[tag=quiver.item]

item modify entity @s weapon.offhand {function:"set_count",add:true,count:-1}
execute store result storage quiver:quiver count int 1 run scoreboard players operation @s quiver.count.arrows += #1 quiver.CONST
function(with storage quiver:quiver):
  $item modify entity @s weapon.mainhand {function:"set_components",components:{lore:[{"text":"$(count) / 192","color":"gray"}]}}
execute at @s run playsound minecraft:item.armor.equip_generic master @a ~ ~ ~ 1 1
