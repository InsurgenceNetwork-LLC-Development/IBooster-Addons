name = "WildChests-Addon"
version = "1.0.2"
author = "Hxtch"
description = {"This addon will add", "Support for WildChests boosting"}

local TYPE = "Sell"
local NAMESPACE = "WILD_CHESTS"

utils.subscribeToEvent("com.bgsoftware.wildchests.api.events.SellChestTaskEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setMultiplier(event:getMultiplier() + multi)
    end
end)