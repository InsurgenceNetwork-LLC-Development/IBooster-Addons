name = "CyberLevels-Addon"
version = "1.0.2"
author = "Hxtch"
description = {"This addon will add", "Support for CyberLevels boosting"}

local TYPE = "Levels"
local NAMESPACE = "CYBER_LEVELS"

utils.subscribeToEvent("net.zerotoil.dev.cyberlevels.api.events.XPChangeEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setAmount(boosterUtils.calculateAmount(event:getAmount(), multi))
    end
end)