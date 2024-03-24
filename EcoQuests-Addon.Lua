name = "EcoQuests-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for EcoQuests boosting"}

local NAMESPACE = "ECO_QUESTS"

utils.subscribeToEvent("com.willfp.ecoquests.api.event.PlayerTaskExpGainEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), "Quests", NAMESPACE)

    if multi > 0 then
        event:setAmount(boosterUtils.calculateAmount(event:getAmount(), multi))
    end

end)