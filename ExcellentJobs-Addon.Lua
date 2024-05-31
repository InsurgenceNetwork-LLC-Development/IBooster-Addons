name = "ExcellentJobs-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for ExcellentJobs boosting"}

local TYPE = "Jobs"
local NAMESPACE = "EXCELLENT_JOBS"

utils.subscribeToEvent("su.nightexpress.excellentjobs.api.event.JobXPGainEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setXP(boosterUtils.calculateAmount(event:getXP(), multi))
    end
end)

utils.subscribeToEvent("su.nightexpress.excellentjobs.api.event.JobPaymentEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setAmount(boosterUtils.calculateAmount(event:getAmount(), multi))
    end
end)