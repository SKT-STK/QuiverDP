for_range = list(range(0, 191 + 1))
for_range.reverse()
for i in for_range:
  execute if data entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}].components."minecraft:custom_data"."quiver.arrows"[i] run return run data modify storage quiver:quiver count set value i

data modify storage quiver:quiver count set value -1
