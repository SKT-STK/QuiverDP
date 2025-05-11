execute unless data entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}].components."minecraft:custom_data"."quiver.arrows"[0] run return run advancement revoke @s only quiver:using_bow

execute unless score @s quiver.using.bow matches 1..:
  execute if items entity @s weapon.mainhand bow[enchantments={}] run item modify entity @s weapon.mainhand {function:"set_components",components:{enchantment_glint_override:false,rarity:"common"}}
  enchant @s quiver:quiver

advancement revoke @s only quiver:using_bow
advancement revoke @s only quiver:stop_using_bow_tick
scoreboard players set @s quiver.using.bow 2
