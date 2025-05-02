tag @s add quiver.shot_arrow
execute on origin if data entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}].components."minecraft:custom_data"."quiver.arrows"[0] run return run function quiver:shot_arrow/quiver
tag @s remove quiver.shot_arrow

data modify entity @s pickup set value 1b
execute if entity @s[type=arrow,nbt={item:{id:"minecraft:arrow"}}] on origin run clear @s arrow 1
execute if entity @s[type=arrow,nbt={item:{id:"minecraft:tipped_arrow"}}] if data entity @s item.components."minecraft:potion_contents".potion on origin run function quiver:shot_arrow/clear_tipped_potion_m with entity @s Inventory[{id:"minecraft:tipped_arrow"}].components."minecraft:potion_contents"
execute if entity @s[type=arrow,nbt={item:{id:"minecraft:tipped_arrow"}}] if data entity @s item.components."minecraft:potion_contents".custom_effects on origin run function quiver:shot_arrow/clear_tipped_effects_m with entity @s Inventory[{id:"minecraft:tipped_arrow"}].components."minecraft:potion_contents"
execute if entity @s[type=spectral_arrow] on origin run clear @s spectral_arrow 1
