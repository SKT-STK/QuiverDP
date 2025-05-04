execute in quiver:quiver_forceload run forceload add 0 0
execute in quiver:quiver_forceload run data modify block 0 0 0 item set from entity @s SelectedItem
execute in quiver:quiver_forceload run data remove block 0 0 0 item.components."minecraft:enchantments".levels."quiver:quiver"
execute in quiver:quiver_forceload run data remove block 0 0 0 item.components."minecraft:enchantment_glint_override"
execute in quiver:quiver_forceload run item replace entity @s weapon.mainhand from block 0 0 0 container.0
execute in quiver:quiver_forceload run forceload remove all
