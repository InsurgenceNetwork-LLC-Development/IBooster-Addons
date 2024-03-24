name = "EcoJobs-Addon"
version = "1.0.0"
author = "Dragon"
description = {"This addon will add", "Support for EcoJobs boosting"}

local NAMESPACE = "ECO_JOBS"

utils.subscribeToEvent("com.willfp.ecojobs.api.event.PlayerJobExpGainEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), "Jobs", NAMESPACE)

    if multi > 0 then
        event:setAmount(boosterUtils.calculateAmount(event:getAmount(), multi))
    end
end)