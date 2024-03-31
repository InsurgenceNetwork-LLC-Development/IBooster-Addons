name = "ManifestCollector-Addon"
version = "1.0.2"
author = "Hxtch"
description = {"This addon will add", "Support for ManifestCollector boosting"}

local TYPE = "Sell"
local NAMESPACE = "MANIFEST_COLLECTOR"

utils.subscribeToEvent("org.hassan.plugin.collector.event.CollectorSellEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setPrice(boosterUtils.calculateAmount(event:getPrice(), multi))
    end
end)