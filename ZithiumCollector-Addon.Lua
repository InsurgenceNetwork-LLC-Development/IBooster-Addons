name = "ZithiumCollector-Addon"
version = "1.0.2"
author = "Dragon"
description = {"This addon will add", "Support for ZithiumCollector boosting"}

local TYPE = "Sell"
local NAMESPACE = "ZITHIUM_COLLECTOR"

utils.subscribeToEvent("net.zithium.collectors.events.CollectorAutoSellEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setTotalWorth(boosterUtils.calculateAmount(event:getTotalWorth(), multi))
    end
end)

utils.subscribeToEvent("net.zithium.collectors.events.CollectorSellAllEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setTotalWorth(boosterUtils.calculateAmount(event:getTotalWorth(), multi))
    end
end)

utils.subscribeToEvent("net.zithium.collectors.events.CollectorSellEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setTotalWorth(boosterUtils.calculateAmount(event:getTotalWorth(), multi))
    end
end)