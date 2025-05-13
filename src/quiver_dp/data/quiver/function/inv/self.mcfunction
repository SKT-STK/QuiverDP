execute store result score @s quiver.count.full_quiver run clear @s #quiver:quivers[item_model="quiver:quiver_full"] 0

execute unless score @s quiver.count.full_quiver matches 2.. run return -1

tellraw @s ["", {"text": "[QUIVER] ", "color": "red", "bold": true}, {"text": "You cannot have more then one loaded quiver in your inventory at a time!", "color": "red"}]

execute if score @s quiver.count.full_quiver matches 1.. run return run execute:
  execute store result score @s quiver.pos.x run data get entity @s Pos[0] 100
  execute store result score @s quiver.pos.z run data get entity @s Pos[2] 100
  tag @s add quiver.this
  execute anchored eyes positioned ^ ^ ^1 summon marker:
    execute store result score @s quiver.pos.x run data get entity @s Pos[0] 100
    execute store result score @s quiver.pos.z run data get entity @s Pos[2] 100
    
    scoreboard players operation @p[tag=quiver.this] quiver.pos.x -= @s quiver.pos.x
    scoreboard players operation @p[tag=quiver.this] quiver.pos.z -= @s quiver.pos.z

    kill @s

  tag @s remove quiver.this
  scoreboard players operation @s quiver.pos.x *= #-1 quiver.CONST
  scoreboard players operation @s quiver.pos.z *= #-1 quiver.CONST

  execute anchored eyes run summon item ~ ~ ~ {Tags:["quiver.this"],Item:{id:dirt},PickupDelay:40}
  execute store result entity @n[tag=quiver.this] Motion[0] double 0.004 run scoreboard players get @s quiver.pos.x
  execute store result entity @n[tag=quiver.this] Motion[2] double 0.004 run scoreboard players get @s quiver.pos.z
  data modify storage quiver:quiver slot set from entity @s Inventory[{components:{"minecraft:item_model":"quiver:quiver_full"}}].Slot
  function quiver:_/inv/self_m:
    $data modify entity @n[tag=quiver.this] Item set from entity @s Inventory[{Slot:$(slot)b}]
    $item replace entity @s container.$(slot) with air
  function quiver:_/inv/self_m with storage quiver:quiver
  tag @e remove quiver.this
