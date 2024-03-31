import 'java.math.BigInteger'

name = "BattlePass-Addon"
version = "1.0.2"
author = "Hxtch"
description = {"This addon will add", "Support for BattlePass boosting"}

local TYPE = "Quests"
local NAMESPACE = "BATTLE_PASS"

utils.subscribeToEvent("io.github.battlepass.api.events.user.UserQuestProgressionEvent", function(event)
    local multi = boosterUtils.getMulti(event:getUser():getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:getAddedProgress():multiply(BigInteger(string.format(multi)))
    end
end)