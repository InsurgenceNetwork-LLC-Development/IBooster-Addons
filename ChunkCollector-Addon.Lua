name = "ChunkCollector-Addon"
version = "1.0.2"
author = "Hxtch"
description = {"This addon will add", "Support for ChunkCollector boosting"}

local TYPE = "Sell"
local NAMESPACE = "CHUNK_COLLECTOR"

utils.subscribeToEvent("dev.kbejj.chunkcollector.events.CollectorAutoSellEvent", function(event)
    local multi = boosterUtils.getMulti(event:getOfflinePlayer():getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setSellPrice(boosterUtils.calculateAmount(event:getSellPrice(), multi))
    end
end)