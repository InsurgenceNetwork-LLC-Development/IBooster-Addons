name = "MMOCore-Addon"
version = "1.0.2"
author = "Hxtch"
description = {"This addon will add", "Support for MMOCore boosting"}

local TYPE = "Skills"
local NAMESPACE = "MMOCORE"

utils.subscribeToEvent("net.Indyuce.mmocore.api.event.PlayerExperienceGainEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setExperience(boosterUtils.calculateAmount(event:getExperience(), multi))
    end
end)