name = "KingdomsX-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for KingdomsX boosting"}

local TYPE = "Resource"
local NAMESPACE = "KINGDOMSX"

utils.subscribeToEvent("org.kingdoms.events.items.structures.ExtractorCollectEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:getKingdomItem():setCollected(boosterUtils.calculateAmount(getCollectedResourcePoints(), multi))
    end
end)