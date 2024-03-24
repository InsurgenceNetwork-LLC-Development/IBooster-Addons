name = "ManifestCollector-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for ManifestCollector boosting"}

local NAMESPACE = "MANIFEST_COLLECTOR"

utils.subscribeToEvent("org.hassan.plugin.collector.event.CollectorSellEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), "Sell", NAMESPACE)

    if multi > 0 then
        event:setPrice(boosterUtils.calculateAmount(event:getPrice(), multi))
    end
end)