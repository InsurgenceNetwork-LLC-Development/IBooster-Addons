name = "AsuraCollector-Addon"
version = "1.0.3"
author = "Hxtch"
description = {"This addon will add", "Support for ChunkCollector boosting"}

local TYPE = "Sell"
local NAMESPACE = "CHUNK_COLLECTOR"

utils.subscribeToEvent("dev.asurasoftware.asuracollector.events.CollectorAutoSellEvent", function(event)
    if event:getOfflinePlayer():getPlayer() = nil then
       return
    end
    local multi = boosterUtils.getMulti(event:getOfflinePlayer():getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setSellPrice(boosterUtils.calculateAmount(event:getSellPrice(), multi))
    end
end)
