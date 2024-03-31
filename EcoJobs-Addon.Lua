name = "EcoJobs-Addon"
version = "1.0.2"
author = "Dragon"
description = {"This addon will add", "Support for EcoJobs boosting"}

local TYPE = "Jobs"
local NAMESPACE = "ECO_JOBS"

utils.subscribeToEvent("com.willfp.ecojobs.api.event.PlayerJobExpGainEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setAmount(boosterUtils.calculateAmount(event:getAmount(), multi))
    end
end)