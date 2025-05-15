tag @s add quiver.this

execute on origin:
  data modify storage quiver:quiver spectral set value "minecraft:spectral_arrow"
  execute store success score @s quiver.BOOL.is_spectral run data modify storage quiver:quiver spectral set from entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}].components."minecraft:custom_data"."quiver.arrows"[0].id
  execute if score @s quiver.BOOL.is_spectral matches 0:
    execute at @e[tag=quiver.this] summon spectral_arrow run data modify entity @s Motion set from entity @n[tag=quiver.this] Motion
    kill @e[tag=quiver.this]
  data modify entity @n[tag=quiver.this] item set from entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}].components."minecraft:custom_data"."quiver.arrows"[0]

  summon item ~ ~ ~ {Tags:["quiver.item"],PickupDelay:-1,Item:{id:dirt}}
  data modify entity @n[tag=quiver.item] Item set from entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}]
  data remove entity @n[tag=quiver.item] Item.components."minecraft:custom_data"."quiver.arrows"[0]
  data modify storage quiver:quiver slot set from entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}].Slot
  execute store result score @s quiver.count.arrows run data get entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}].components."minecraft:custom_data"."quiver.arrows"
  execute if score @s quiver.count.arrows matches ..64 run data modify entity @n[tag=quiver.item] Item.components."minecraft:damage" set value 75
  execute if score @s quiver.count.arrows matches 65..128 run data modify entity @n[tag=quiver.item] Item.components."minecraft:damage" set value 50
  execute if score @s quiver.count.arrows matches 129.. run data modify entity @n[tag=quiver.item] Item.components."minecraft:damage" set value 30
  execute store result storage quiver:quiver count int 1 run scoreboard players operation @s quiver.count.arrows -= #1 quiver.CONST
  function quiver:_/shot_arrow/self_m:
    $execute if score @s quiver.count.arrows matches 0 run item replace entity @s container.$(slot) with music_disc_13[!jukebox_playable,custom_data={quiver.quiver:true,quiver.arrows:[]},consumable={consume_seconds:100000},item_name="Empty Arrow Quiver",item_model="quiver:quiver_empty",max_stack_size=1,rarity="common",max_damage=99,damage=99]
    $execute if score @s quiver.count.arrows matches 1.. run item replace entity @s container.$(slot) from entity @n[tag=quiver.item] contents
    $item modify entity @s container.$(slot) {function:"set_components",components:{"minecraft:lore":[{"text":"$(count) / 192","color":"gray"}]}}
  function quiver:_/shot_arrow/self_m with storage quiver:quiver
  kill @e[tag=quiver.item]

tag @s remove quiver.this
