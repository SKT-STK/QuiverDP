execute unless items entity @s container.* #quiver:quivers[item_model="quiver:quiver_full"] run return run advancement revoke @s only quiver:using_crossbow

execute unless score @s quiver.using.crossbow matches 1..:
  data modify storage quiver:quiver slot set from entity @s Inventory[{components:{"minecraft:custom_data":{quiver.quiver:true}}}].Slot
  function quiver:_/crossbow/advancement_m:
    $item modify entity @s container.$(slot) {function:"set_item",item:"music_disc_13"}
  function quiver:_/crossbow/advancement_m with storage quiver:quiver

advancement revoke @s only quiver:using_crossbow
advancement revoke @s only quiver:stop_using_crossbow_tick
scoreboard players set @s quiver.using.crossbow 2
