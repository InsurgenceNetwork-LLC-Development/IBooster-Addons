name = "Sellwand-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for Sellwand boosting"}

local NAMESPACE = "SELLWAND"

utils.subscribeToEvent("me.zachary.sellwand.api.events.SellwandSellEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), "Sell", NAMESPACE)

    if multi > 0 then
        event:setSellPrice(boosterUtils.calculateAmount(event:getSellPrice(), multi))
    end

end)