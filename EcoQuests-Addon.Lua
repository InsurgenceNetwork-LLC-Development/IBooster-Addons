name = "EcoQuests-Addon"
version = "1.0.2"
author = "Hxtch"
description = {"This addon will add", "Support for EcoQuests boosting"}

local TYPE = "Quests"
local NAMESPACE = "ECO_QUESTS"

utils.subscribeToEvent("com.willfp.ecoquests.api.event.PlayerTaskExpGainEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setAmount(boosterUtils.calculateAmount(event:getAmount(), multi))
    end

end)