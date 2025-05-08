data modify storage quiver:quiver spectral set value "minecraft:spectral_arrow"
execute store success score @s quiver.BOOL.is_spectral run data modify storage quiver:quiver spectral set from entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}].components."minecraft:custom_data"."quiver.arrows"[0].id
execute if score @s quiver.BOOL.is_spectral matches 0 run function quiver:shot_arrow/quiver_spectral
data modify entity @n[tag=quiver.shot_arrow] item set from entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}].components."minecraft:custom_data"."quiver.arrows"[0]

summon item ~ ~ ~ {Tags:["quiver.item"],PickupDelay:-1,Item:{id:dirt}}
data modify entity @n[tag=quiver.item] Item set from entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}]
data remove entity @n[tag=quiver.item] Item.components."minecraft:custom_data"."quiver.arrows"[0]
data modify storage quiver:quiver slot set from entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}].Slot
function quiver:shot_arrow/arrows_count
execute store result score @s quiver.count.arrow run data get storage quiver:quiver count
execute if score @s quiver.count.arrow matches ..63 run data modify entity @n[tag=quiver.item] Item.components."minecraft:damage" set value 75
execute if score @s quiver.count.arrow matches 64..127 run data modify entity @n[tag=quiver.item] Item.components."minecraft:damage" set value 50
execute if score @s quiver.count.arrow matches 128.. run data modify entity @n[tag=quiver.item] Item.components."minecraft:damage" set value 30
function quiver:shot_arrow/quiver_m with storage quiver:quiver
kill @e[tag=quiver.item]
