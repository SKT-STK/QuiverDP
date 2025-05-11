item_modifiers = [
  {
    function: 'set_components',
    components: {
      '!minecraft:enchantment_glint_override': {},
      '!minecraft:rarity': {}
    }
  },
  {
    function: 'set_enchantments',
    enchantments: {
      'quiver:quiver': 0
    }
  }
]

scoreboard players remove @s quiver.using.bow 1
execute if score @s quiver.using.bow matches 1.. run return run advancement revoke @s only quiver:stop_using_bow_tick
scoreboard players set @s quiver.using.bow 0

item modify entity @s weapon.mainhand item_modifiers
