name = "mcMMO-Addon"
version = "1.0.2"
author = "Hxtch"
description = {"This addon will add", "Support for mcMMO boosting"}

local TYPE = "Skills"
local NAMESPACE = "MCMMO"

utils.subscribeToEvent("com.gmail.nossr50.events.experience.McMMOPlayerPreXpGainEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setXpGained(boosterUtils.calculateAmount(event:getXpGained(), multi))
    end
end)