advancement revoke @s only quiver:inv_changed
function quiver:inv/self

function quiver:_/offhand/check_quiver_offhand:
  execute if items entity @s weapon.offhand #quiver:quivers[item_model="quiver:quiver_full"] run return 1
  execute if items entity @s weapon.offhand #quiver:quivers[item_model="quiver:quiver_empty"] run return 1
  return fail

function quiver:_/offhand/check_quiver_inv_not_mainhand:
  execute if items entity @s container.* #quiver:quivers[item_model="quiver:quiver_full"] if items entity @s weapon.offhand bow unless items entity @s weapon.mainhand #quiver:quivers[item_model="quiver:quiver_full"] run return 1
  execute if items entity @s container.* #quiver:quivers[item_model="quiver:quiver_empty"] if items entity @s weapon.offhand bow unless items entity @s weapon.mainhand #quiver:quivers[item_model="quiver:quiver_empty"] run return 1
  return fail

function quiver:_/offhand/check_quiver_inv_is_mainhand:
  execute if items entity @s container.* #quiver:quivers[item_model="quiver:quiver_full"] if items entity @s weapon.offhand bow if items entity @s weapon.mainhand #quiver:quivers[item_model="quiver:quiver_full"] run return 1
  execute if items entity @s container.* #quiver:quivers[item_model="quiver:quiver_empty"] if items entity @s weapon.offhand bow if items entity @s weapon.mainhand #quiver:quivers[item_model="quiver:quiver_empty"] run return 1
  return fail

execute if function quiver:_/offhand/check_quiver_offhand run function quiver:offhand/swap
execute if function quiver:_/offhand/check_quiver_inv_not_mainhand run function quiver:offhand/swap
execute if function quiver:_/offhand/check_quiver_inv_is_mainhand run function quiver:offhand/quiver_inv_is_mainhand
