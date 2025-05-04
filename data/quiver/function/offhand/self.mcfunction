advancement revoke @s only quiver:inv_changed
function quiver:inv/self

execute if function quiver:offhand/check_quiver_offhand run function quiver:offhand/swap
execute if function quiver:offhand/check_quiver_inv_not_mainhand run function quiver:offhand/swap
execute if function quiver:offhand/check_quiver_inv_is_mainhand run function quiver:offhand/quiver_inv_is_mainhand
