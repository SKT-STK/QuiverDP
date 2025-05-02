OUT_PATH = r'D:\Games\Minecraft\profiles\nigger\saves\quiver_dp\datapacks\QuiverDP\data\quiver\function\shot_arrow\arrows_count.mcfunction'

lines = []
for i in reversed(range(192)):
  lines.append(
    f'execute if data entity @s Inventory[{{components:{{"minecraft:custom_data":{{quiver.quiver:true}}}}}}].components."minecraft:custom_data"."quiver.arrows"[{i}] run return run data modify storage quiver:quiver count set value {i}'
  )
  
lines.append(
  'data modify storage quiver:quiver count set value -1'
)

with open(OUT_PATH, 'w') as file:
  file.writelines([line + '\n' for line in lines])
